/*
 *
 *  Author: Lauren Sherburne
 *  Date: 01/21/2023
 *
 *  CSCI 477: Assignment 1 - ASCII Art Craps Game
 *
 */

// include the necessary libraries and such
#include "Dice.h";
#include <iostream>
using namespace std;

// function declarations to check for a win/loss
bool isFirstRollWon(int sum);
bool isFirstRollLost(int sum);
bool isGameWon(int sum, int point);
bool isGameLost(int sum);


int main() {
    // welcome the player to the game
    cout << "Welcome to the game of craps!\n\n";

    // game variables
    Dice dice;
    int rollSum;
    bool isGameOver = false;

    // loop to replay the game until the player decides to exit
    while(true) {

        // perform the first roll, check for a win/loss
        cout << "Your first roll is..." << endl;
        rollSum = dice.rollDice();
        if (isFirstRollWon(rollSum)) {
            isGameOver = true;
            cout << "Congratulations! You won!!\n\n\n" << endl;
        } else if (isFirstRollLost(rollSum)) {
            isGameOver = true;
            cout << "Ah shoot...you lost :/\n\n\n" << endl;
        }

        // sum becomes the player's "point" if the game is not won or lost
        int playerPoint = rollSum;


        // game loop
        while (!isGameOver) {
            // print the player's point then perform a roll
            cout << "Your point is " << playerPoint << endl;
            cout << "Your roll is..." << endl;
            rollSum = dice.rollDice();

            // check for win/loss
            if (isGameWon(rollSum, playerPoint)) {
                isGameOver = true;
                cout << "Congratulations! You won!!" << endl;
                cout << "The sum of your dice (" << rollSum << ") is equal to your point: " << playerPoint << "\n\n\n";
            } else if (isGameLost(rollSum)) {
                isGameOver = true;
                cout << "Ah shoot...the sum is 7 so you lost :/\n\n\n";
            }
        }

        // ask the user if they would like to play again
        cout << "Would you like to play again? (Y/N)" << endl;
        char userChoice;
        cin >> userChoice;

        // reset the variables and loop if yes, return 0 to terminate if no
        if (userChoice == 'Y' || userChoice == 'y') {
            cout << "Resetting variables and starting new round..." << endl;
            isGameOver = false;
        } else if (userChoice == 'N' || userChoice == 'n') {
            cout << "Thank you for playing! Goodbye." << endl;
            return 0;
        } else {
            cout << "Your choice was not recognized...program terminating" << endl;
            return 0;
        }

        // return 0 to indicate that the program terminated successfully
    }


    // return 0 to indicate that the program terminated successfully
    return 0;
}


/*
 *
 *  The following helper functions are used to check for a win/loss at various points in the game.
 *
 */


// return true if the sum of the first roll is 7 or 11
bool isFirstRollWon(int sum) {
    if (sum == 7 || sum == 11) {
        return true;
    } else {
        return false;
    }
}


// return true if the sum is 2, 3, or 12
bool isFirstRollLost(int sum) {
    if (sum == 2 || sum == 3 || sum == 12) {
        return true;
    } else {
        return false;
    }
}


// return true if the sum is equal to the point
bool isGameWon(int sum, int point) {
    if (sum == point) {
        return true;
    } else {
        return false;
    }
}


// return true if the sum is equal to 7
bool isGameLost(int sum) {
    if (sum == 7) {
        return true;
    } else {
        return false;
    }
}
