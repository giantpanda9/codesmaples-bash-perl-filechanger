#!/usr/bin/perl
use strict;
use warnings;
use File::Find;
use File::Basename;

my @files;
my $folder = dirname(__FILE__) . "/Folder one/"; # Setting the level one folder name
find( # Using find to find all files recursively
    sub { push @files, $File::Find::name unless -d; }, 
    $folder
);
my $i = 1; # Setting counter for new file name
for my $file (@files) { # loop through the files acquired
    my ($oldfilename,$filepath,$extension) = fileparse($file,qr"\..[^.]*$"); # obtainf file chunks
    my $extensionfilename = $oldfilename . $extension; # get old file name with extension for test
    if ($oldfilename !~ m/[^a-zA-Z0-9]/ && length $extensionfilename < 32) { # test if old file name contains alphanumeric and file name with extension contains length is less than 32 characters
      print $extensionfilename . " is fine\n" # if so skip the file
    } else { # otherwise fi the file
      my $newfilename = $oldfilename;
      $newfilename =~ s/[^a-zA-Z0-9]//g; #removing special charcters
      $newfilename = substr($newfilename, 0, 8); # and cut the file to 8.+3
      $newfilename .= $i; # add the counter value to meet the requirement of file name to be unique - this will break the 8.3 DOS format
      print "Renaming " . $oldfilename . " to " .$newfilename . "\n"; # and rename the file
      $newfilename = $filepath . $newfilename . $extension;
      rename $file, $newfilename or die "Cannot rename file: $!";
      $i++;
    }
}
exit
