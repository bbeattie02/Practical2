# CSC2059 Practical 2: Introduction to C++ Functions

Welcome to Practical 2.

In this practical you will explore some of the fundamental building blocks of C++ programming, including:

* Function declarations and implementations
* Header (`.h`) and source (`.cpp`) files
* Parameters and return values
* Defensive programming
* Basic mathematical functions
* Simple automated testing

## Repository Structure

```text
.
├── README.md
├── Makefile
├── .gitignore
├── myFunctions.h
├── myFunctions.cpp
├── main.cpp
└── tests/
    └── test_functions.cpp
```

### Key Files

| File                     | Purpose                                              |
| ------------------------ | ---------------------------------------------------- |
| `myFunctions.h`          | Function declarations (prototypes)                   |
| `myFunctions.cpp`        | Function implementations                             |
| `main.cpp`               | Small program used to experiment with your functions |
| `tests/test_functions.cpp` | Automated tests                                      |
| `Makefile`               | Build and test commands                              |

## Getting Started

First, verify that the program compiles and runs:

```bash
make run
```

Next, run the public tests:

```bash
make test
```

You should see at least one test fail initially. This is expected because some functions have not yet been implemented.

Your goal is to complete the missing implementations in `myFunctions.cpp` and progressively make more tests pass.

## Build and test commands

Run commands from the repository root (the folder containing `Makefile`). On
Windows use the CSC2059 Terminal; on macOS/Linux use the integrated terminal
configured in Lab 0.

| Command | Meaning |
|---|---|
| `make` or `make build` | Build the manual program and tests without running them. |
| `make run` or `make run-main` | Build and run the manual program. |
| `make test` or `make test-functions` | Build and run the function tests. |
| `make clean` | Remove generated files in `bin/`; keep source files. |
| `make help` | Display the available commands. |

Compiled programs go in `bin/`, which the supplied `.gitignore` excludes from
Git. Save your changes before rerunning a Make command; it rebuilds the program
when needed. Ordinary source or header edits do not require `make clean`.

Lab 2 uses C++ `assert`: the first failed assertion stops the test program, so
later checks have not run. Read the whole test file to see what is checked,
then fix each failure and rerun. The interactive calculator and `sortPrint`
exercises still need manual testing.

## Recommended Workflow

Work in small steps:

```text
Read the task
↓
Edit the code
↓
Run make test
↓
Fix any issues
↓
Commit your work
↓
Push your work
↓
Repeat
```

Useful Git commands:

```bash
git status
git add .
git diff --staged
git commit -m "Describe your change"
git push
```

Save your files, check that generated files are ignored, and inspect the staged
diff before committing. Commit useful progress even while other functions remain
unfinished; all required tests and manual checks should pass at completion.

## Stretch Goals

If you complete all tasks early, consider adding your own utility function to the library.

Examples:

* `maximum()`
* `minimum()`
* `isEven()`
* `cube()`
* `factorial()`

Remember to add both the declaration to `myFunctions.h` and the implementation to `myFunctions.cpp`.  Use the `main.cpp` file to test your implementation!

Good luck, and remember: compiler errors are not personal. They are merely strongly worded suggestions.
