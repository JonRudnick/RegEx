Name: Jonathan Rudnick
Points: 15/15
[1/1]: all required files are present, and all required information is in the readme file.
[1/1]: the program runs with the proper input/output interface (even if it gives the wrong results)
[8/8]: the program runs correctly when given two input lists like in the sample run.
[3/3]: the program uses Perl subroutines in some meaningful way.
[2/2]: the program implements a random-word-list feature.
Files:
 -dict.txt: a small dictionary file
 -one.txt: the first test file
 -two.txt: the second test file
 -RudnickHW8.pl: the program
 -readme.txt: the readme
Instructions: In the command line, the program can be entered with two arguments or with none.
	In the case of two arguments, the user will still be given the option of running the 
	program	using a random list. Once the program has been run, instructions will be given 
	within the program.

Sample Runs:
>perl RudnickHW8.pl
 one.txt two.txt
Use of my $_ is experimental at RudnickHW8.pl line 143.
Would you like to provide the files [0] or use a random list [1]?
0


Match this list:
Apple
Bacon
Cheese
Burger

Don't match this list:
Dino
Dragon
Jake
Kelly

Enter a regular expression: (A|B|C)

(A|B|C) worked!
(A|B|C) is the new best regex! It has a score of 7

Match this list:
Apple
Bacon
Cheese
Burger

Don't match this list:
Dino
Dragon
Jake
Kelly

Best regex so far: (A|B|C)
Best score: 7

Enter a regular expression: A|B|C

A|B|C worked!
A|B|C is the new best regex! It has a score of 5

Match this list:
Apple
Bacon
Cheese
Burger

Don't match this list:
Dino
Dragon
Jake
Kelly

Best regex so far: A|B|C
Best score: 5

Enter a regular expression: A|B

That pattern doesn't match all of the first list.

Match this list:
Apple
Bacon
Cheese
Burger

Don't match this list:
Dino
Dragon
Jake
Kelly

Best regex so far: A|B|C
Best score: 5

Enter a regular expression: K

That pattern matched Kelly

Match this list:
Apple
Bacon
Cheese
Burger

Don't match this list:
Dino
Dragon
Jake
Kelly

Best regex so far: A|B|C
Best score: 5

>perl RudnickHW8.pl
 one.txt two.txt
Use of my $_ is experimental at RudnickHW8.pl line 143.
Would you like to provide the files [0] or use a random list [1]?
1


Match this list:
virtue
morning's
against
remind
lands


Don't match this list:
stream
tanks
programs
insists
chooses