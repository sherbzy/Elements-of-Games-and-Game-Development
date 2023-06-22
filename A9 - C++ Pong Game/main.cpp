//
//  main.cpp
//  Week12_Starter
//
//  Created by Kathleen Kelly on 3/29/23.
//

#include <iostream>
#include "Game.h"

int main(int argc, char * argv[]) {
    Game game;
    
    bool bSuccess = game.Initialize();
    if (bSuccess) {
        game.RunLoop();
    }
    
    game.Shutdown();
    return 0;
}
