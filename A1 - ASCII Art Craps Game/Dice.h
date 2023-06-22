//
// Created by lauren on 1/21/23.
//

#ifndef A1_ASCII_ART_CRAPS_GAME_DICE_H
#define A1_ASCII_ART_CRAPS_GAME_DICE_H


class Dice {
public:
    // constants used to hold the number of sides
    const static int NUM_SIDES = 6;

    Dice();     // constructor
    ~Dice();    // deconstructor

    // public function definitions that generates and draws a random dice roll
    int rollDice();

private:
    // private helper functions for rolling the dice
    void drawDice(int num);

    // private function definitions to draw the dice using ASCII art
    void drawDiceOne();
    void drawDiceTwo();
    void drawDiceThree();
    void drawDiceFour();
    void drawDiceFive();
    void drawDiceSix();
};


#endif //A1_ASCII_ART_CRAPS_GAME_DICE_H
