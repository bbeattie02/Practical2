#include"../myFunctions.h"

#include <cassert>
#include <cmath>
#include <iostream>
#include <cstdlib>

bool approxEqual(double a, double b, double tolerance = 0.0001){
    return std::fabs(a - b) < tolerance;
}


// Supplied harness: a function must return to its caller, not call exit(0).
// Check this at normal program exit so an early exit cannot appear to pass.
bool allTestsRan = false;

void checkTestCompletion(){
    assert(allTestsRan && "A tested function ended the program before the tests finished");
}

int main(){
    std::atexit(checkTestCompletion);
    std::cout << "Running public tests..." <<std::endl;

    // Test iAdd
    assert(iAdd(2,3) == 5);
    assert(iAdd(-2,5) == 3);

    // Test integer division
    assert(divideXbyY(6,2) == 3);
    assert(divideXbyY(5,2) == 2);

    // Test double division
    assert(approxEqual(divideXbyY(1.0,2.0),0.5));
    assert(approxEqual(divideXbyY(7.5,2.5),3.0));

    // Test defensive division by zero
    assert(divideXbyY(5,0) == 0);
    assert(approxEqual(divideXbyY(5.0, 0.0), 0.0));

    // Test Log
    assert(approxEqual(Log(1.0),0.0));
    assert(approxEqual(Log(std::exp(1.0)), 1.0));
    assert(approxEqual(Log(0.0), 0.0));
    assert(approxEqual(Log(-1.0), 0.0));

    // Test Sqrt
    assert(approxEqual(Sqrt(4.0), 2.0));
    assert(approxEqual(Sqrt(0.0), 0.0));
    assert(approxEqual(Sqrt(-4.0), 0.0));

    // Test Calculator
    assert(approxEqual(myCalculator(3.0, '+', 2.0), 5.0));
    assert(approxEqual(myCalculator(3.0, '-', 2.0), 1.0));
    assert(approxEqual(myCalculator(3.0, '*', 2.0), 6.0));
    assert(approxEqual(myCalculator(3.0, '/', 2.0), 1.5));
    assert(approxEqual(myCalculator(3.0, '/', 0.0), 0.0));
    assert(approxEqual(myCalculator(3.0, '?', 2.0), 0.0));

    allTestsRan = true;
    std::cout << "All public tests passed, Good job!" << std::endl;

    return 0;
}
