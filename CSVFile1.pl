use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main{
	
	my $filename = 'CSVFile.csv';
	
	open(INPUT,$filename) or die "file is not opening $filename /n";
	
	<INPUT>;
	
	while(my $line = <INPUT>){
		chomp $line;
		
		print "\n $line";
	
		
		my @values = split '/\s*,\s*/' , $line;
		
		print $values[0]. "\n";
		
		#print join '|' , @values;
		
		print Dumper(@values);
	}
	close(INPUT);
}

main();
