my ($p1, $p2) X= 0;

for '2.txt'.IO.lines -> $line {
    my @v = $line.words>>.Int;
    ++$p1 if safe(@v);
    ++$p2 if (@v | @v.combinations(+@v-1).any).&safe;
}

sub safe(@v) { 
    my $diffs = [and] (@v[1..*] Z- @v).map: { .abs ~~ 1..3 };
    return $diffs && (@v ~~ @v.sort | @v.sort.reverse);
}

say $p1;
say $p2;
