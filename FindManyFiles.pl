use strict;
use warnings;

sub main {
	
	my @files = ('C:\Users\ejaybag\Desktop\altamira proj\logs.txt',
	             'C:\Users\ejaybag\Desktop\altamira proj\information.txt',
	             'C:\Users\ejaybag\Desktop\altamira proj\missing.txt',
	             );
	
	foreach my $file (@files){
		if(-f $file)
		{
		print "files are found : $file \n";
	} else{
		print "files not found : $file \n";
		
	}

}
}
main();
