#!/usr/bin/perl -w
no warnings "portable";

my (@lines, @libz, @libo);

if ($#ARGV+1 != 1) {
	print "usage: file.pl <input file>\n";
	return;
}

open FILE, $ARGV[0] or die "open: $!";
@lines = <FILE>;
close FILE;

for (my $idx = 0; $idx < $#lines-2; ) {
	@libz = split /-/, $lines[$idx++];
	@libo = split /-/, $lines[$idx++];
	#print "libc: $libc[0] ld: $ld[0]\n";
	printf "diff: " . (hex($libo[0]) - hex($libz[0])) . "\n";
}
