# String Calculator TDD Kata
This repository showcases the fundamentals and application of Test-Driven Development (TDD) using a straightforward example. It emphasizes how adhering to the TDD methodology leads to cleaner, more maintainable codebases.

---

## Table of Contents
- [Overview](#overview)
- [Test Cases](#test-cases)
  - [Handle Any Number of Inputs](#1-handle-any-number-of-inputs)
  - [Support Newlines Between Numbers](#2-support-newlines-between-numbers)
  - [Support Custom Delimiters](#3-support-custom-delimiters)
  - [Negative Number Handling](#4-negative-number-handling)
  - [Multiple Negative Numbers](#5-multiple-negative-numbers)
- [Getting Started](#getting-started)
- [Conclusion](#conclusion)

---

## Overview

Create a simple **String Calculator** with the following method signature:

```ruby
int add(string numbers)
```

- **Input**: A string containing comma-separated numbers.
- **Output**: An integer representing the **sum** of the numbers.

---

## Test Cases

### 1. Handle Any Number of Inputs
- The `add` method should handle an **unlimited** number of numbers.
- Example:
  ```ruby
  add("1,2,3,4,5") => 15
  ```

---

### 2. Support Newlines Between Numbers
- Allow **newlines (`\n`)** in addition to commas as delimiters.
- Example:
  ```ruby
  add("1\n2,3") => 6
  ```

---

### 3. Support Custom Delimiters
- A **custom delimiter** can be defined at the start of the string:
  ```
  //[delimiter]\n[numbers...]
  ```
- Example:
  ```ruby
  add("//;\n1;2") => 3
  ```

---

### 4. Negative Number Handling
- If a **negative number** is present, throw an exception with the message:
  ```
  negative numbers not allowed <negative_number>
  ```
- Example:
  ```ruby
  add("4,-1,6")
  # => Raises: "negative numbers not allowed -1"
  ```

---

### 5. Multiple Negative Numbers
- If **multiple negative numbers** are found, list all in the exception message separated by commas.
- Example:
  ```ruby
  add("4,-1,-5,6")
  # => Raises: "negative numbers not allowed -1,-5"
  ```

---

## Getting Started

Follow the steps below to create the project and run the tests:

```bash
# Create project directory
mkdir string-calculator-tdd-kata
cd string-calculator-tdd-kata

# Initialize a Gemfile
bundle init

# Add 'rspec' to the Gemfile manually:
# gem 'rspec'

# Install dependencies
bundle install

# Initialize RSpec (sets up spec folder and config)
bundle exec rspec --init

# Run your RSpec tests
bundle exec rspec
```

## Conclusion

This simple calculator example demonstrates how the Test-Driven Development (TDD) approach leads to a more structured and thoughtful implementation in software development. By taking small, test-driven steps, the codebase evolves naturally, promoting clean, maintainable, and testable code that adheres to SOLID principles.

You can follow the commit history to observe the progressive evolution of the implementation.


