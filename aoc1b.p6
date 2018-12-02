my @freq = 'aoc1input.txt'.IO.slurp.words;
my %sums;
my $running = 0;

for flat @freq xx * {
    $running += $_;
    %sums{$running}++;
    say $running and last if %sums{$running} > 1;
}
