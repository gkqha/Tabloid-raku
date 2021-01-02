use lib '.';
use tabloidActions;
use tabloidGrammar;

my $code = 'test.lng'.IO.slurp();
my $result = tabloidGrammar.parse($code,:actions(tabloidActions));
say $result;