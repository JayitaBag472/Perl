use strict;
use warnings;

$|=1;

sub main{
	
	my $filename = 'CSVFile.csv';
	
	open(INPUT,$filename) or die "file is not opening \n";
	
	<INPUT>;
	
	my @lines;
	
	#my $count =0;
	while (my $lines = <INPUT>){
		chomp $lines;
		
		print "$lines \n";
		
		push @lines,$lines;
	}
	close(INPUT);
	
	
	#foreach my $line(@lines) {
		#print $line . "\n";
	
}

main();