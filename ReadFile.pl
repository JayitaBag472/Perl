use strict;
use warnings;

#$|=1;

sub main{
	
	my $file = 'C:\Users\ejaybag\Desktop\altamira proj\logs.txt';
	
	open(INPUT, $file) or die("file not found \n");
	
	while(my $line = <INPUT>){
		print $line;
	}
	
	print "abcd \n";
	
	close(INPUT);
	
	
	
	
	
}
main();