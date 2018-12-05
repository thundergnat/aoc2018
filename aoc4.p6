my %guard;
my ($g, $sl, $aw);

for 'aoc4input.txt'.IO.lines.sort -> $i {
    my $event = $i.substr(19);
    if $event.contains('Guard') {
        $g = $event.comb(/\d+/).first;
        %guard{$g}<sleep> //= [0 xx 60];
        %guard{$g}<total> //= 0;
    }
    elsif $event.contains('falls') {
        $sl = +$i.substr(15,2);
    }
    else {
        my $aw = +$i.substr(15,2);
        ($sl ..^ $aw).map: { %guard{$g}<sleep>[$_]++ };
        %guard{$g}<total> += $aw - $sl;
    }
}

.say for %guard.sort( +*.key );

say "\nPart A: most minutes slept:";
say my $most = %guard.sort( +*.value.<total> )[*-1];
say 'Guard:  ', $most.key;
say 'minute: ', $most.value<sleep>.maxpairs[0].key, ' @ ', $most.value<sleep>.maxpairs[0].value;
say 'answer: ', $most.key * $most.value<sleep>.maxpairs[0].key;

say "\nPart B: most of a particular minute slept:";
say my $longest = %guard.sort( +*.value.<sleep>.max )[*-1];
say 'Guard:  ', $longest.key;
say 'minute: ', $longest.value<sleep>.maxpairs[0].key, ' @ ', $longest.value<sleep>.maxpairs[0].value;
say 'answer: ', $longest.key * $longest.value<sleep>.maxpairs[0].key;
