use strict;
use 5.10.0;

my $hf = "    includes:\n      before_body: header.html\n      after_body: footer.html\n---";

while(<>){
	last if $. > 2 && /---/;
	print;
}

say $hf;

while(<>){
	print;
}

