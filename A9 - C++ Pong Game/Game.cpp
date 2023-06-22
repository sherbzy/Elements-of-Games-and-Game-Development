#include "Game.h"
#include <iostream>
using namespace std;



Game::Game() {
	_pWindow = nullptr;
	_pRenderer = nullptr;
	_bIsRunning = true;
	_nTickCount = 0;
}


Game::~Game() {
}

// Initialize the game.
bool Game::Initialize() {
	// Initialize SDL.
	int sdlResult = SDL_Init(SDL_INIT_VIDEO);
	if (sdlResult != 0) {
		SDL_Log("Unable to initialize SDL: %s", SDL_GetError());
		return false;
	}

	// Create the SDL window.
	_pWindow = SDL_CreateWindow("Pong", WINDOW_X, WINDOW_Y, WINDOW_WIDTH, WINDOW_HEIGHT, 0);
	if (_pWindow == nullptr) {
		SDL_Log("Failed to create window: %s", SDL_GetError());
		return false;
	}

	// Create the SDL renderer for all drawing.
	_pRenderer = SDL_CreateRenderer(_pWindow, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
	if (_pRenderer == nullptr) {
		SDL_Log("Failed to create renderer: %s", SDL_GetError());
		return false;
	}

	// Game-specific initialization.
	_leftPaddlePos.x = PADDLE_OFFSET;	// left paddle
	_leftPaddlePos.y = WINDOW_HEIGHT / 2;
	_leftPaddleDir = 0;

	_rightPaddlePos.x = WINDOW_WIDTH - PADDLE_OFFSET - PADDLE_WIDTH;	// right paddle
	_rightPaddlePos.y = WINDOW_HEIGHT / 2;
	_rightPaddleDir = 0;

	_ballPos.x = WINDOW_WIDTH / 2;	// ball
	_ballPos.y = WINDOW_HEIGHT / 2;
	_ballVelocity.x = -200;
	_ballVelocity.y = 235;

	return true;
}

// Run the overall game loop.
void Game::RunLoop() {
	// Keep running the game until it is over.
	while (_bIsRunning) {
		_processInput();
		_updateGame();
		_generateOutput();
	}
}

// Shutdown the game.
void Game::Shutdown() {
	// Cleanup SDL.
	SDL_DestroyRenderer(_pRenderer);
	SDL_DestroyWindow(_pWindow);
	SDL_Quit();
}

void Game::_processInput() {
	// Poll for events in the window.
	// Needed to keep the window open.
	SDL_Event event;
	while (SDL_PollEvent(&event)) {
		switch (event.type) {
			case SDL_QUIT:
				_bIsRunning = false;
				break;
		}
	}

	// Get the entire state of the keyboard in an unsigned integer array.
	const Uint8* state = SDL_GetKeyboardState(NULL);

	// Check state of particular keys.
	if (state[SDL_SCANCODE_ESCAPE]) {
		_bIsRunning = false;
	}

	// Check for W/S keys to move left paddle.
	_leftPaddleDir = 0;
	if (state[SDL_SCANCODE_W]) {
		_leftPaddleDir = -1;
	}
	if (state[SDL_SCANCODE_S]) {
		_leftPaddleDir = 1;
	}

	// Check I/K keys to move right paddle
	_rightPaddleDir = 0;
	if (state[SDL_SCANCODE_I]) {
		_rightPaddleDir = -1;
	}
	if (state[SDL_SCANCODE_K]) {
		_rightPaddleDir = 1;
	}
}

void Game::_updateGame() {
	// Wait until 16ms have elapsed.
	while (!SDL_TICKS_PASSED(SDL_GetTicks(), _nTickCount + 16));

	// Delta time is the difference in ticks from the last frame
	// to this frame, converted to seconds.
	float deltaTime = (SDL_GetTicks() - _nTickCount) / 1000.f;
	_nTickCount = SDL_GetTicks();

	/*
		Paddle Movement
	*/

	// left paddle update
	if (_leftPaddleDir != 0) {
		// Don't let the paddle leave the top or bottom of the screen
		int newPaddlePos = _leftPaddlePos.y + (_leftPaddleDir * 300 * deltaTime);
		if (newPaddlePos >= (WALL_HEIGHT) && newPaddlePos <= (WINDOW_HEIGHT - PADDLE_HEIGHT)) {
			_leftPaddlePos.y = newPaddlePos;
		}
	}

	// right paddle update
	if (_rightPaddleDir != 0) {
		// Don't let the paddle leave the top or bottom of the screen
		int newPaddlePos = _rightPaddlePos.y + (_rightPaddleDir * 300 * deltaTime);
		if (newPaddlePos >= (WALL_HEIGHT) && newPaddlePos <= (WINDOW_HEIGHT - PADDLE_HEIGHT)) {
			_rightPaddlePos.y = newPaddlePos;
		}
	}

	// Update the ball based on its velocity.
	_ballPos.x += _ballVelocity.x * deltaTime;
	_ballPos.y += _ballVelocity.y * deltaTime;

	/*
		Ball Collision
	*/

	// top and bottom walls
	if ((_ballPos.y >= WINDOW_HEIGHT - 2 * 15 && _ballVelocity.y > 0)
		|| (_ballPos.y <= WALL_HEIGHT && _ballVelocity.y < 0)) {
		_ballVelocity.y *= -1;
	}

	// left paddle
	int diff = _leftPaddlePos.y - _ballPos.y;
	if (diff <= 0 
		&& diff >= -100 
		&& _ballPos.x <= 25 
		&& _ballPos.x >= 20 
		&& _ballVelocity.x < 0) {
		_ballVelocity.x *= -1;
	}

	// right paddle
	diff = _ballPos.y - _rightPaddlePos.y;
	// cout << "diff: " << diff << endl;
	if (diff >= 0
		&& diff <= 100
		&& _ballPos.x >= (WINDOW_WIDTH - 2 * 15) 
		&& _ballPos.x <= ((WINDOW_WIDTH - 2 * 15) + 5)
		&& _ballVelocity.x > 0) {
		_ballVelocity.x *= -1;
	}
}

void Game::_generateOutput() {
	// Set background to blue.
	SDL_SetRenderDrawColor(_pRenderer, 0, 0, 255, 255);

	// Clear the back buffer to be ready to draw.
	SDL_RenderClear(_pRenderer);

	// Draw top and bottom white walls.
	SDL_SetRenderDrawColor(_pRenderer, 255, 255, 255, 255);
	SDL_Rect wall{ 0, 0, WINDOW_WIDTH, WALL_HEIGHT};
	SDL_RenderFillRect(_pRenderer, &wall);

	wall.y = WINDOW_HEIGHT - WALL_HEIGHT;
	SDL_RenderFillRect(_pRenderer, &wall);

	// Draw the left and right white paddles
	SDL_Rect paddle{ _leftPaddlePos.x, _leftPaddlePos.y, PADDLE_WIDTH, PADDLE_HEIGHT };
	SDL_RenderFillRect(_pRenderer, &paddle);	// left paddle
	paddle.x = _rightPaddlePos.x;
	paddle.y = _rightPaddlePos.y;
	SDL_RenderFillRect(_pRenderer, &paddle);	// right paddle

	// Draw white pong ball.
	SDL_Rect ball{ _ballPos.x, _ballPos.y, BALL_WIDTH, BALL_WIDTH };
	SDL_RenderFillRect(_pRenderer, &ball);

	// Swap the front and back buffers.
	SDL_RenderPresent(_pRenderer);
}
