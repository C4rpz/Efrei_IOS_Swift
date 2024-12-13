// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Dispatch

print("Open Trivia")

// NB: Replace the `DispatchQueue.main.asyncAfter` with your code.
// Once the program is done, call `exit(EXIT_SUCCESS)` to exit the program.
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    print("I'm done!")
    exit(EXIT_SUCCESS)
}

dispatchMain()
