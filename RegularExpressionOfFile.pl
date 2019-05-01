use strict;
use warnings;

sub main {
 my $file= 'C:\Users\ejaybag\Desktop\altamira proj\information.txt';
 
 open(INPUT, $file) or die ('file not found $file \n');
 
 while (my $line =<INPUT>){
 	#if($line=~ /select/)
 	   if($line=~ /wh./ig){
 	print $line;
 }
 }
 
  close(INPUT);
}

main();
