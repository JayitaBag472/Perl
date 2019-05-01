use strict;
use warnings;

use LWP::Simple;

sub main {
	print "Downloading...\n";
	# print get("https://www.google.com/?gws_rd=ssl");
	
	my $file =getstore("https://www.google.com/?gws_rd=ssl","home.html");
	
	my $file1=getstore('https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',"logo.png");
	
	if ($file1==200){
		print "success";
	}else
	{
		print "failed";
	}
	print "Finished\n"
	
}

main();
