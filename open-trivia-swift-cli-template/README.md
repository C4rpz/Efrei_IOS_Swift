# Open Trivia Swift CLI

## Fork the base repository.

Start by creating your own fork of this template project.

## Install Swift

To have swift toolchains installed, see this link.
https://www.swift.org/install/

#### Visual Studio Code extension

To enjoy code completion in *Visual Studio Code*, do not hesitate to install the [Swift extension](https://github.com/swiftlang/vscode-swift).

## Run

`swift run opentrivia`

## Exercise

The project is a Swift command-line tool that will fetch **trivia questions** from [Open Trivia Database API](https://opentdb.com/api_config.php).

## Command line entry point. 

Take a look at `/Sources/opentrivia/main.swift`. 

You'll notice: 
* A first `print` command, keep it or not. 
* The `DispatchQueue.main.asyncAfter` call. It demonstrates how to wait before exiting the program. Replace this with the asynchronious code that will perform the tool's logic. Once the tool has completed the trivia, call `exit(<exit_code>)` (where exit_code is 0 for success (or `EXIT_SUCCESS`), or an error code).  
* The `dispatchMain()` call. Do not remove it. It avoids the program to exit immediatly.

## Steps to complete

* Fetch random questions calling `https://opentdb.com/api.php?amount=10`.
* Parse the `JSON` response. 
* For each trivia question, display to the user : 
    - The question's category
    - The question's difficulty
    - The list of possible answers by mixing and shuffling the correct one and incorrect ones. Each possible answer will be asigned a number starting at 1. 
    - Wait for the user's keyboard input. The input must be the answer's number. If the input is invalid, wait for another input. 
    - Compare the user's answer with the correct answer. 

## Bonus points

* For keeping scores.
* For following clean architercure.
* For not using GenAI tools. Please don't. Pleaaaase! 
