# Connect Four Coding Challenge

Implement the Connect Four game as command-line app written in Ruby.

If you are not familiar with the game, read the
**[Game Mechanics](index.md#game-mechanics)** and
**[Sample Game Play](index.md#sample-game-play)** sections for a description of
how the game is played and concluded.

We have provided a scaffold project as a starting point. It implements the
minimum required to be able to run the game loop.

Your goal is to complete the rest of the game using the scaffold project as a
starting point.

You'll find the project at https://github.com/jurisgalang/connect_four - clone
it into your own GitHub repo and commit your changes there.

## Task Guidelines

- There is no need to implement an AI or electornic player. The app only needs
  to be able to officiate the game play between human players.
- We'll be reviewing the implementation for class and system design (modularity,
  extensibility, separation of concerns, etc); attention to detail (code layout,
  formatting, etc); level of proficiency in the language; and quality of tests.
- Feel free to alter the structure and code of the classes that was included in
  the scaffold project to fit your solution.

## Game Mechanics

Connect Four is a two-player connection game in which the players first choose a
color and then take turns dropping colored discs from the top into a
7-columns x 6-rows vertically suspended grid.

The pieces fall straight down, occupying the next available space within the
column.

The objective of the game is to be the first to form a horizontal, vertical, or
diagonal line of four of one's own discs.

The game is a tie if the entire grid is filled with discs and neither player
were able to effect a winning configuration.

See: https://en.wikipedia.org/wiki/Connect_Four

## Sample Game Play

There are two players: Alice (black discs) and Bob (white discs)

1. Alice takes her turn and drops a disc in column 1 (cell 0, 0); The disc rests
  at the bottom (cell 0, 5)

2. Bob takes his turn and drops a disc also in column 1 (cell 0, 0); the disc
   slides all the way down until it is blocked by Alice's disc, resting on top
   of it (cell 0, 4)

3. The game progresses alternating between Alice and Bob's turn to drop a disc
   at a column of their choice until one of the following conditions occur:

   3a. A horizontal, vertical, or diagonal line of four discs of the same color
       is formed. In which case the player who own the color wins.

   3b. All cells in the grid is occupied by a disc. And if there is no line of
       four discs of the same color, then the game is a tie.
