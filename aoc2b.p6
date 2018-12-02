my @ids = 'aoc2input.txt'.IO.slurp.words;
for ^@ids -> $i {
    for $i ^..^ @ids -> $j {
        my @diff = @ids[$i].ords »-« @ids[$j].ords;
        say join "\n", @ids[$i], @ids[$j], @diff.join.subst(/<-[0]>/, '↑')\
          .subst(/<[0]>/, ' ', :g) if one(@diff);
    }
}
