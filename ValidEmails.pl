use strict;
use warnings;

$|=1;

sub main{
	
	my @emails=('jayita.bag@gmail.com',
	             'jayita.com',
	             'jayitabag472@gmail.com',
	             '@jayita.com',
	);
	
	foreach my $email (@emails){
		if($email =~ /\w+\@\w+\.\w+/){
			
			print "$email:email is valid \n";
			
			}else
			{
				print "$email:email is not valid \n"
			}
	}
	
}

main()