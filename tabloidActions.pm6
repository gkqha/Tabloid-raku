my %var;

class tabloidActions {
    method variable-declaration($/) {
        %var{~$<variable-name>} = +$<value>;
    }

    method function-call($/) {
        say %var{$<variable-name>} if $<function-name> eq 'YOU WON\'T WANT TO MISS';
    }

    method number($/) {
        my $n = $<integer> ?? $<integer>.made !! $<floating-point>.made;
        $n *= $<sign>.made if $<sign>;
        $n *= 10 ** $<exponent>.made if $<exponent>;
        $/.make($n);
    }

    method integer($/) {
        $/.make(+$/);
    }

    method floating-point($/) {
        my $int = 0;
        my $frac = 0;

        if $<integer>.elems == 2 {
            ($int, $frac) = $<integer>;
        }
        else {
            $frac = $<integer>[0];
        }

        my $n = $int + $frac / 10 ** $frac.chars;

        $/.make($n);
    }

    method sign($/) {
        $/.make(~$/ eq '-' ?? -1 !! 1);
    }

    method exponent($/) {
        my $e = $<integer>;
        $e *= -1 if $<sign> && ~$<sign> eq '-';
        $/.make($e);
    }
}