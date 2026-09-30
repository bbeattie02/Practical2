# Shared CSC2059 build conventions: g++, C++17, and generated files in bin/.
CXX = g++
CPPFLAGS =
CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

BIN_DIR = bin
EXEEXT =
ifeq ($(OS),Windows_NT)
EXEEXT = .exe
endif

# Lab 2 introduces assertions; Catch2 adds an all-tests mode in Lab 3.
TEST_MODE ?= first
ifneq ($(TEST_MODE),first)
$(error Lab 2 uses assert and supports only TEST_MODE=first; the all-tests mode starts in Lab 3)
endif

PROGRAMS = $(BIN_DIR)/main$(EXEEXT)
TESTS = $(BIN_DIR)/test_functions$(EXEEXT)
TEST_TARGETS = test-functions

.PHONY: all build run run-main test $(TEST_TARGETS) clean help

# --- Build -------------------------------------------------------------------
# Bare make builds the programs and tests without running them.
all: build ## Use the default target: same as make build.

build: $(PROGRAMS) $(TESTS) ## Build the programs and tests in bin/ without running them.

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# List headers as prerequisites so saved header edits also trigger a rebuild.
# Compile only the .cpp files; the header is included by those source files.
$(BIN_DIR)/main$(EXEEXT): main.cpp myFunctions.cpp myFunctions.h Makefile | $(BIN_DIR)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) main.cpp myFunctions.cpp -o $@

$(BIN_DIR)/test_functions$(EXEEXT): tests/test_functions.cpp myFunctions.cpp myFunctions.h Makefile | $(BIN_DIR)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) tests/test_functions.cpp myFunctions.cpp -o $@

# --- Run ---------------------------------------------------------------------
run: run-main ## Build and run the manual program (same as make run-main).

run-main: $(BIN_DIR)/main$(EXEEXT) ## Build and run the manual program.
	./$<

# Run groups in order. Preserve failure status even when continuing later groups.
# This loop is shared with later labs; Lab 2 has just one assertion-based group.
# --- Test --------------------------------------------------------------------
test: ## Build and run the function assertions; stop at the first failure.
	@echo "Test groups: $(TEST_TARGETS) (mode: $(TEST_MODE))"
	@status=0; \
	for target in $(TEST_TARGETS); do \
		if $(MAKE) --no-print-directory $$target; then :; \
		else \
			status=1; \
			if [ "$(TEST_MODE)" = first ]; then exit 1; fi; \
		fi; \
	done; \
	exit $$status

test-functions: $(BIN_DIR)/test_functions$(EXEEXT) ## Build and run the function assertions; stop at the first failure.
	./$<

# --- Clean -------------------------------------------------------------------
clean: ## Remove generated files in bin/.
	rm -rf $(BIN_DIR)

# --- Help --------------------------------------------------------------------
help: ## Show the available build, run and test commands.
	@echo "make / make build: build programs and tests without running them"
	@echo "make run / make run-main: build and run the manual program"
	@echo "make test / make test-functions: run assertions, stopping at the first failure"
	@echo "make clean: remove generated files in bin/"
