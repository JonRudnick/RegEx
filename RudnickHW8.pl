#!/usr/bin/perl -w
# RudnickHW8.pl
#author: Jonathan Rudnick

use strict;
use warnings;
use List::Util qw/shuffle/;

my $list = $ARGV[0]; #receives the first argument
my $nolist = $ARGV[1]; #receives the second argument
my $winningPattern = ' '; #holds the winning pattern
my $winningScore = 999999; #initialized high for lack of max_int value
my @match; #holds the first array
my @nomatch; #holds the second array

#prompt user to choose pre-selected or random lists
print "Would you like to provide the files [0] or use a random list [1]? \n";
my $response = <STDIN>;

#option 0 for pre-selected files
if ($response == '0')
{
	#open each file and store their data in arrays
	open(MATCH, '<', $list) or die "Can't read source file $list: $!\n";
	@match = <MATCH>;
	
	open(NOMATCH, '<', $nolist) or die "Can't read source file $nolist: $!\n";
	@nomatch = <NOMATCH>;
	
	#close files
	close MATCH;
	close NOMATCH;
}

#option 1 for random lists
elsif ($response == '1')
{
    #retrieve dictionary file
    my $dict = 'dict.txt';

    #open file and get ten words
    open (DICT, '<', $dict) or die "Cannot open $dict:$!";
    my @dict = <DICT>;

    #close file
    close DICT;

    #shuffle the words and use five for each list
    my @randWords = shuffle(@dict);
    @match = @randWords[0 .. 4];
    @nomatch = @randWords[5 .. 9];
}

#loop so that the user can try multiple expressions
do {

#display each list
print "\n\nMatch this list:\n";
print @match;
print "\n\nDon't match this list:\n";
print @nomatch;


#display the best regex score so far if one has been guessed
if ($winningScore != 999999) 
{
	print "\n\nBest regex so far: ", $winningPattern;
	print "\nBest score: ", $winningScore;
}

#prompt the user for a regex
print "\n\nEnter a regular expression: ";
my $pattern = <STDIN>;
chomp($pattern);

#check that the regex matches all of the first list and none of the second list
if (checker(\$pattern,\@match) == 1 && nochecker(\$pattern,\@nomatch) == 1)
{
	print "\n$pattern worked!";
	if (length($pattern) < $winningScore) #if the regex is the shortest yet
	{
		$winningPattern = $pattern;
		$winningScore = length($pattern);
		print "\n$winningPattern is the new best regex! It has a score of ", $winningScore;
	}		
}
elsif (nochecker(\$pattern,\@nomatch) != 1) #print any matches from the second list
{
	print "\nThat pattern matched ", noMatches(\$pattern,\@nomatch);
}
elsif (checker(\$pattern,\@match) != 1) #tell the user if they failed to match the first list
{
	print "\nThat pattern doesn't match all of the first list."
}

} while (1);


#subroutine to find out if the regex matches the first list
sub checker
{
	my $counter = 0;
	my $patternref = $_[0];
	my @matchref = @{$_[1]};
	while (<@matchref>) 
	{
		if (/$$patternref/)
		{
	    	$counter++; #counter keeps track of matches
		}
	}
	if ($counter == scalar @match) #returns 1 if the counter matches the size of the list
	{
		return 1;
	}
}

#subroutine to find out if the regex matches the second list
sub nochecker
{
	my $patternref = $_[0];
	my @matchref = @{$_[1]};
	my $counter = 0;
	while (<@matchref>) 
	{
		if (/$$patternref/)
		{
	    	$counter++; #counter keeps track of matches
		}
	}
	if ($counter == 0)
	{
		return 1; #returns 1 only if there were no matches
	}
}

#subroutine to find and return all the words matched in the second list
sub noMatches 
{
	my $patternref = $_[0];
	my @matchref = @{$_[1]};
	my @matches;
	foreach my $_ (@matchref)
	{
		if (/$$patternref/)
		{
	    	push(@matches, $_); #add second list matches to a new array
		}
	}
	return @matches;
}