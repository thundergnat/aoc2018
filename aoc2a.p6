my @ids = 'aoc2input.txt'.IO.slurp.words;
my @cnts = @ids.map: *.comb.Bag.values.unique;
say @cnts.grep( *.contains(2) ) * @cnts.grep( *.contains(3) );
