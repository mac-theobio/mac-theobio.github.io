use strict;
use 5.10.0;

my $target = shift @ARGV;

while(<>){
	chomp;
	s|\([\w.-]*_files/|(${target}_files/|;
	say;
}
