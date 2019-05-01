use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main{
	
	my $filename = 'CSVFile.csv';
	
	open(INPUT,$filename) or die "file is not opening \n";
	
	<INPUT>;
	
	my @lines;
	
	
	while (my $line = <INPUT>){
		chomp $line;
		
		print "$line \n";
		
		push @lines,$line;
	}
	close(INPUT);
	
	
	print $lines[3][0];
	
	foreach my $line(@lines) 
	{
		print Dumper($line);
	
}

}
main();

