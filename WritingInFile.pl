use strict;
use warnings;

$|=1;
sub main {
	my $file ="output.txt";
	
	open(INPUT,'>'.$file) or die ("can not craete a file \n");
	
	print INPUT "Hello World \n";
	
     close(INPUT);
}

main();
