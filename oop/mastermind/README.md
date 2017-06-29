# Mastermind for Odin Project

Be aware, that the class descriptions were written before the implmentations and I did not update when something changed.

## Architecture

* Main Class that starts game
* Game Class controls turns and asks players to do their part
* Players tell game what they do
* Board knows what the players put on the board, can draw itself

## Game Class

    # public methods
    play: starts the game
    turn: starts next turn
    ask_for_tiles: Asks a player for a guess or what they you to put as secret
    code_maker
    code_breaker

## Board Class

    # public methods
    new: initializes board (extension with n-Width?)
    draw: Draws the board with all current tiles, knows about the current state and when to reveal itself
    code: defines hidden tiles
    break_attempt: puts a guess on the board, returns correct position / correct color
    code_broken? : lets the game know whether the code is broken
    all_attempts_used? : lets the game know when code_breaker ran out of lines

    # model stuff
    available_colors should each be marked by a letter or a number
    code = [1,2,3,4] #best simple integers, that are represented by a color


## Player Class

    #public methods
    new: Creates new player with a name
    prompt_for_guess:
    prompt_for_secret_code:


## Learnings

* Test driven was really nice here to handle the board. the rest then was easy
* I really still have trouble when matching elements in non trivial ways, for example the gettings correct positions and colors, lost a lot of time there.
* I always struggle thinking logically through problems, like which solutions the AI should throw out. It just get stuck there, and advance very slowly. Better to write some tests for it, and start from there. I definitely would have won time.
* Still not sure how to make a player aware of the board state, is passing the state really the right way to go, let me check what others did. 
* Still need to learn how to make `gets` easily testable.
* Wrote a module for the first time, made complete sense to me.