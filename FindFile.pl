use strict;
use warnings;

sub main {

	my $file = 'C:\Users\ejaybag\Desktop\altamira proj\logs.txt';

	if ( -f $file ) {
		print "file has found : $file \n";
	}
	else {
		print "file not found :$file \n";
	}
}

main();
