#pragma once

#include "SDL.h"

// Generic Game class.
class Game
{
public:
	struct Vector2 {
		int x;
		int y;
	};

	Game();
	~Game();

	// Initialize the game.
	bool Initialize();

	// Run the game loop until the game is over.
	void RunLoop();

	// Shutdown the game.
	void Shutdown();

private:
	void _processInput();

	void _updateGame();

	void _generateOutput();

	// SDL window and renderer.
	SDL_Window* _pWindow;
	SDL_Renderer* _pRenderer;

	// Is the game still running.
	bool _bIsRunning;

	// Number of ticks since the start of the game.
	Uint32 _nTickCount;

	// Pong-specific attributes.
	Vector2 _leftPaddlePos;
	int _leftPaddleDir;
	Vector2 _rightPaddlePos;
	int _rightPaddleDir;
	Vector2 _ballPos;
	Vector2 _ballVelocity;

	/*
		Constants
	*/
	// Window Constants
	const int WINDOW_HEIGHT = 668;
	const int WINDOW_WIDTH = 1024;
	const int WINDOW_X = 100;
	const int WINDOW_Y = 50;

	// Game Constants
	const int WALL_HEIGHT = 15;
	const int PADDLE_WIDTH = 15;
	const int PADDLE_HEIGHT = 100;
	const int PADDLE_OFFSET = 10;
	const int BALL_WIDTH = 15;

};

