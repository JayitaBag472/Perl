use strict;
use warnings;

sub main{
	
	my $inputfile = 'C:\Users\ejaybag\Desktop\altamira proj\logs.txt';
	
	open (INPUT,$inputfile) or die "can not open file $inputfile \n";
	
	my $outputfile = "output1.txt";
	
	open(OUTPUT,'>'.$outputfile) or die "can not create file  $outputfile \n";
	
	while (my $line=<INPUT>){
		
		if($line=~ /select/){
		   $line =~ s/from/FROM/ig;
		   print OUTPUT $line;
		}
		
	}
	
	
	
	close(INPUT);
	close(OUTPUT);
	
}

main();