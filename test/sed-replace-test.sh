#!/usr/bin/env roundup

describe "sed replace"

before() {
  # This is before the testing. Do any setup here.
  :
}

it_replaces_first_occurences() {
  # Make files with the test input and the expected output.
  echo "This is a test line\n" > input
  echo "ThXs is a test line\n" > expected

  cat input | sed 's/i/X/' > output
  
  # Test that output is the same as expected
  diff output expected
}

it_replaces_all_occurences() {
  echo "This is a test line\n" > input
  echo "ThXs Xs a test lXne\n" > expected

  cat input | sed 's/i/X/g' > output
  
  # Test that output is the same as expected
  diff output expected
}


after() {
  # This is after the testing. Do any teardown here.
  rm input output expected
}
