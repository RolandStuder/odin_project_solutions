# Tic Tac Toe for Odin Project

Some thinking here, to think what classes and methods I might need.

## Game

Should be class, just sounds reasonable. it is a thing to me. It should handle all input and output, unless for draw functions.

* `new` Start a game.
* `start` Should ask for player configuration...
* `exit` Stop a game prematurely
* `turn` Should move action to the next player. And resolve if win condition has been reached...
* `over?` Should know when it is over.
* The game somehow needs to know whose turn it is.
* And the game needs to know when it is over.
* Game has to assign X and O

## Player

Also seem natural that this is an object, also I would like this abstract, so I can add an AI or a human player...

* `new`
* `prompt_for_action` needs to be part of player, because AI will need to react differently and game should not need to know, if it has AI players or not.
* `name` Should the class itself ask for the name? Seems more like a controller responsability.
* `wins`
* `loses`
* `statistics` returns wins and losses

## board

I imagine a big board. Could be configurable on the size. But it might get tricky to draw the tiles, if it's not a fixed size.

        +-------+-------+-------+
        | X  X  |       |       |
        |  X    |       |       |
        | X  X  |       |       |
        +-------+-------+-------+
        |       |       |       |
        |       |       |       |
        |       |       |       |
        +-------+-------+-------+
        |       |  OO   |       |
        |       | O  O  |       |
        |       |  OO   |       |
        +-------+-------+-------+

* Needs to keep track of the tiles on himself
* `draw` Should know how to draw itself. As this is a bit complex, it is not the games responsability
* `put` a tile, X or O at position.
* `end?` Should the board or the game handle the win condition? But then it should return winning party or draw.


## Tile

A player need to put tiles, they certainly seem to be objects, even though they belong to the board or the game.

* `draw` should a tile draw itself?
