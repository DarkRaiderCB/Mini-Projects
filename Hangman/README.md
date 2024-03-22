# Hangman Game Documentation

This Hangman game allows players to guess letters to reveal a hidden word. The objective is to guess the word correctly before running out of lives.

## Usage

1. Save `art.py`, `words.py` and `main.py` in the same directory. Run the `main.py` script in a Python environment.

2. The game will display the Hangman logo and the initial state of the Hangman.

3. Players will be prompted to guess a letter.

4. If the guessed letter is correct, it will be revealed in the hidden word, and the player's lives may increase if they haven't reached the maximum.

5. If the guessed letter is incorrect, the player will lose a life.

6. The game continues until the player correctly guesses the entire word or runs out of lives.

## Game Components

### 1. Hangman Logo and Art

- The game displays the Hangman logo and initial Hangman figure using ASCII art from the `art.py` module.

### 2. Word Selection

- The game randomly selects a word from the list of words provided in the `words.py` module.

### 3. Game Progress

- Players are shown the length of the word as underscores and prompted to guess a letter.
- Correctly guessed letters are revealed in the word, and incorrect guesses decrease the player's lives.
- The Hangman figure is updated accordingly based on the remaining lives.

### 4. Game Outcome

- If the player guesses the word correctly before running out of lives, they win the game.
- If the player runs out of lives before guessing the word correctly, they lose the game.
