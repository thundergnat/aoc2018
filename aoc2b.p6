my @ids = 'aoc2input.txt'.IO.slurp.words;
for ^@ids -> $i {
    for $i ^..^ @ids -> $j {
        my @diff = @ids[$i].ords »-« @ids[$j].ords;
        if one(@diff) {
            say join "\n", @ids[$i], @ids[$j], @diff.join.subst(/<-[0]>/, '↑')\
              .subst('0', ' ', :g) ;
            my $n = @diff.first( * != 0, :k);
            say @ids[$i].substr(0, $n) ~ @ids[$i].substr($n + 1);
        }
    }
}
