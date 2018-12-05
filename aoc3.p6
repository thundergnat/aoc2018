my @elves = 'aoc3input.txt'.IO.slurp.lines;
my %cloth;
for @elves -> $line {
    my ($id, $x, $y, $l, $w) = $line.comb(/\d+/);
    for ^$l -> $lx {
        for ^$w -> $wy {
            %cloth{"{$x+$lx} {$y+$wy}"}++
        }
    }
}

# part a
say +%cloth.grep: *.value > 1;

for @elves -> $line {
    my ($id, $x, $y, $l, $w) = $line.comb(/\d+/);
    my $last = False;
    for ^$l -> $lx {
        for ^$w -> $wy {
            $last = True if %cloth{"{$x+$lx} {$y+$wy}"} > 1;
            last if $last;
        }
        last if $last;
    }
    # part b
    say $line and last unless $last;
}
