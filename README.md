vogogotest
==========

This is tested in: ruby 2.0.0p481 (2014-05-08 revision 45883) [x86_64-linux]

To demo these files, please:

```bash
git clone https://github.com/jrsfiend/vogogotest.git

cd vogogotest

./vogogo.sh
```

This will demonstrate some sample output.

It's creating files (in that bash script test.txt, test2.txt and test3.txt) by the guidelines (ie. 27 characters to a line, they're fancy and look like numbers but are tough for computers to understand, and there's about 500 entries (2000 lines)/file).

The parametres of the test didn't define how to get sample data to play with, so I wrote a script 'vogogocreate.rb' that generates these three files.

The test did say to have the actual test's script analyze a particular file at a time, so if you were to pass the 'vogogoread.rb' file a file you would do so in the command line, like:

```bash
ruby vogogoread.rb "test.txt"
```

and that would pass it the test.txt.

Please see the resulting three files in your working directory - test.txt, test2.txt, and test3.txt for how a file must be formatted to be used as input for the 'read' script. It conforms with what I understood the format of the machine my manager bought uses for output - but there's always room for misinterpretation :)

The reason I used a class in the reader script is for potential advancements in functionality. Essentially if this was a real-world scenario then there would be more work to be done with the different types of resulting account numbers, and you could easily write them to a variable within the class and then perform other work on the data by using the class object and voila - we're on the way to a usable script.

Some example output:

```
 _  _  _  _     _     _  _ 
  ||_|  | _||_|| ||_|  | _|
  ||_|  | _|  ||_|  |  ||_ 
  
||| _  _  _  _  _  _  _  _ 
 _|  | _||_||_ |_ |_  _| _|
 _|  | _||_||_||_| _| _| _|

    _     _  _  _  _  _  _ 
|_||_||_| _|  ||_ |_ |_| _|
  ||_|  ||_   | _||_||_| _|
```

The first is a great example of an account number that passes validation.

The second has an illegal number - which is just assigned as a random digit in a valid account number and then the top line in that digit is replaced with '|||', in order to provide some illegal account numbers. This unfortunately makes all of the illegal account numbers only have one digit that isn't legible, so it doesn't emulate the machine all that wonderfully - as I'm sure the machine may give more than a single digit in the account number that is illegible.

The last one is a number that doesn't pass the checksum. The reading program would take these three lines, and output:

```
787340472
?73866533 ILL
484275683 ERR
```

Thanks!
