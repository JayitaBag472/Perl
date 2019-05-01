use strict;
use warnings;

$|=1;


sub main{
	
	 my $text = 'the code for this device is GP890.';
	 
	 if ($text=~ /(\w\w\d+)/){
	 	print "the device code is matching '$1'\n"
	 }
	 else {
	 	print "the device code is not matching $1.\n"
	 }
	 
	 
	
}

main();