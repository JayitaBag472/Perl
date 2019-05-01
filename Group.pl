use strict;
use warnings;


$|=1;

sub main{

my $filename = 'C:\Users\ejaybag\Desktop\altamira proj\logs.txt';

open(INPUT,$filename) or die " file is not opening \n";

while(my $line=<INPUT>){
	
	#if ($line=~ /(s.l..t)(...)/){
		
		if($line=~ /(s.*?t)/){
		print "$1 \n";
	}

}
close(INPUT);

}

main()