my $p1 = 0;
my $p2 = 0;

for 'inputs/2.txt'.IO.lines -> $line {
    my @v = $line.split(' ').map: { .Int };
    ++$p1 if safe(@v);
    ++$p2 if safe(@v) || @v.combinations(+@v-1).map(*.&safe).any;
}

sub safe(@v) { 
    my $diffs = [and] (@v[1..*] Z- @v).map: { .abs ~~ 1..3};
    return $diffs && (@v ~~ any [@v.sort, @v.sort.reverse]);
}

say $p1;
say $p2;
