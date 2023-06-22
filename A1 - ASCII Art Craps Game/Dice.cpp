//
// Created by lauren on 1/21/23.
//

#include "Dice.h"
#include <ctime>
#include <cstdlib>
#include <iostream>
using namespace std;

// Dice constructor that seeds random number generator
Dice::Dice() {
    srand(time(0));
    rand();
}


// deconstructor
Dice::~Dice() {}


// function used to generate a random number and draw the dice that was rolled
int Dice::rollDice() {
    // generate two random number between 1 and 6 inclusive
    int rollNum1 = rand() % 6 + 1;
    int rollNum2 = rand() % 6 + 1;

    // draw the rolled dice
    drawDice(rollNum1);
    cout << "...a " << rollNum1 << endl << endl;
    drawDice(rollNum2);
    cout << "... and a " << rollNum2 << endl << endl;

    // return the sum of the two dice
    return rollNum1 + rollNum2;

}


// draws the given dice roll
void Dice::drawDice(int num) {
    // draw the proper dice
    switch(num){
        case 1:
            this->drawDiceOne();
            break;
        case 2:
            this->drawDiceTwo();
            break;
        case 3:
            this->drawDiceThree();
            break;
        case 4:
            this->drawDiceFour();
            break;
        case 5:
            this->drawDiceFive();
            break;
        default:
            this->drawDiceSix();
    }

    // return when done
    return;
}


/*
 *
 *  The following functions draw the respective dice using ASCII art
 *
 */

// draw a roll of one
void Dice::drawDiceOne() {
    // draw a roll of one
    cout << "|       |" << endl;
    cout << "|   O   |" << endl;
    cout << "|       |" << endl;

    // return when done
    return;
}

// draw a roll of two
void Dice::drawDiceTwo() {
    // draw a roll of two
    cout << "| O    "
            " |" << endl;
    cout << "|       |" << endl;
    cout << "|     O |" << endl;

    // return when done
    return;
}

// draw a roll of three
void Dice::drawDiceThree() {
    // draw a roll of three
    cout << "|     O |" << endl;
    cout << "|   O   |" << endl;
    cout << "| O     |" << endl;

    // return when done
    return;
}

// draw a roll of four
void Dice::drawDiceFour() {
    // draw a roll of four
    cout << "| O   O |" << endl;
    cout << "|       |" << endl;
    cout << "| O   O |" << endl;

    // return when done
    return;
}

// draw a roll of five
void Dice::drawDiceFive() {
    // draw a roll of five
    cout << "| O   O |" << endl;
    cout << "|   O   |" << endl;
    cout << "| O   O |" << endl;

    // return when done
    return;
}

// draw a roll of six
void Dice::drawDiceSix() {
    // draw a roll of six
    cout << "| O   O |" << endl;
    cout << "| O   O |" << endl;
    cout << "| O   O |" << endl;

    // return when done
    return;
}

