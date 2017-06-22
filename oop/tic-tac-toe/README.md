# Tic Tac Toe for Odin Project

This features several play modes:

1. 2 Human players against each other
2. 1 Human player against a learning computer
3. Computer vs. Computer, where you can see what's happening
4. And then a fast mode that just lets AIs play against each other, showing some statistics on who is winning.

## Thought / Statistics on the AI

* Both AI just compare to earlier games, to pick a move.
* Generally it looks like the AIs are good at winning, but bad at preventing losses. Which pretty much means, that they are quite stupid.
* That is probably due to them only learning from winning and losses. They try to take a winning or non-losing strategy but don't learn how to do draws and when to go for them.

### AI 1 vs. Random (3000 Games)

        COMPUTER (AI Engine 1)
        Win percentage TOTAL:                63%
        Win percentage for last 1000 Games:  68%
        ==========================
        COMPUTER (Random)
        Win percentage TOTAL:                22%
        Win percentage for last 1000 Games:  17%
        ==========================
        Tie percentage for last 1000 Games:  14%

### AI 2 vs. Random

        COMPUTER (AI Engine 2)
        Win percentage TOTAL:                60%
        Win percentage for last 1000 Games:  66%
        ==========================
        COMPUTER (RANDOM)
        Win percentage TOTAL:                23%
        Win percentage for last 1000 Games:  19%
        ==========================
        Tie percentage for last 1000 Games:  14%

### AI 1 vs. AI 2

        COMPUTER (AI Engine 1)
        Win percentage TOTAL:                39%
        Win percentage for last 1000 Games:  38%
        ==========================
        COMPUTER (AI Engine 2)
        Win percentage TOTAL:                43%
        Win percentage for last 1000 Games:  38%
        ==========================
        Tie percentage for last 1000 Games:  22%


## What should be improved:

* AI avoiding losing tactics going for more draws
* The board has a mix of a X,Y coordination system and tiles saved in an array, should be refactored.
* Test coverage is horrible…

## Learnings

* AI was easily includable by just going for a new class that inherits from exitsting player, that feld super nice...
* A smart AI is not as easy to make as I thought. I underestimated the possible combinations.
* Lettings AI fight each other is fun :-)
