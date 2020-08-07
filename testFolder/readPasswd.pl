#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
use File::Basename;
my $filename = "passwd";
my $debug = 0;

GetOptions ("filename=s"   => \$filename,
            "debug"  => \$debug) or die("Command line arguments error\n"); # get the parameters

my $path = dirname(__FILE__) . "/testPasswd/" . $filename; # path to file
my @filecontents = ();
open(my $FILE, '<', $path) or die "Error while opening file: $!\n"; # open the specified file
while (my $line = <$FILE>) { # and read every line of it
  chomp $line; # remove spaces
  my @fields = split ":" , $line; # split the line as if it is a csv file and delimeter is :
  if ($fields[3] > 500) { # if uid > 500 classify the file to output
    if ($debug == 1) { # if debug mode set
      push(@filecontents, $fields[0] . " " . $fields[3]); # add the uid
    } else {
      push(@filecontents, $fields[0] ); # else add the user name only
    }
  }
}

foreach (@filecontents) { # output the contents of the array
  print "$_\n";
}
exit
