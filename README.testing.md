Testing
=======

[Roundup][roundup] is a testing tool for shell commands/scripts.

To verify the tests work:

    cd tests
    ./roundup
    
This will run the tests in all the files in `tests` that end in `-test.sh` and
indicate whether they are successful or not.

A sample test is included to demonstrate how tests should be written for 
inclusion in `roundup`.

More information and examples [here][roundup] and [here][example].

  
[roundup]: http://bmizerany.github.com/roundup/
[example]: http://itsbonus.heroku.com/p/2010-11-01-roundup
