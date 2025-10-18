![Banner](images/banner.png)  

![Assembly](https://img.shields.io/badge/language-Assembly-blue)

# Lucky Guess 🎲

🕹️ A simple assembly guessing game

## Table of Contents

1. [About](#about)  
2. [Features](#features)  
3. [Requirements](#requirements)  
4. [Installation](#installation)  
5. [Usage](#usage)   

---

## About

This repository contains a simple number-guessing game implemented in x86-64 Assembly.  
The player tries to guess a random number generated from a user-provided seed.  
The game demonstrates basic Assembly programming concepts including function calls, loops, and conditional branching.

---

## Features

- Random number generation based on a user-provided seed.  
- Up to 5 guesses per game.  
- Feedback for correct and incorrect guesses.  
- Simple, interactive terminal-based gameplay.

---

## Requirements

To run this project, you’ll need:

- A Linux or Windows system with an x86-64 environment.  
- GCC (GNU Compiler) to assemble and link the program.  

---

## Installation
Follow these steps to set up the project locally:

---

### 1. Clone the repository
```bash
git clone https://github.com/Amit-Bruhim/Lucky-Guess.git
```
### 2. Navigate into the src folder
```bash
cd Lucky-Guess/src
```
### 3. Compile the Assembly program
```bash
gcc -no-pie -o a.out main.s
```
### 4. Run the main program
```bash
./a.out
```
---

## Usage

When you run the program, you will first be prompted to enter a configuration seed:

![Enter seed](images/enter%20seed.png)

After entering the seed, you will be asked to guess a number between 0 and 9.  
You have up to 5 guesses to find the correct number.  

- If you guess the number correctly within 5 attempts, a **win message** is displayed:  
  🎉 Congratz! You won! 🎉  

- If you fail to guess the number within 5 attempts, a **lose message** is displayed, showing the correct answer.  

### Example
For example, if you enter seed 5 and guess numbers from 1 to 5:

![Game example](images/game%20example.png)

