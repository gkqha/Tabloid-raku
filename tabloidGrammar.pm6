grammar tabloidGrammar {
    rule TOP {
        <statement>* %% ';'
    }
    rule statement {
        | <variable-declaration>
        | <function-call>
   }
    rule variable-declaration {
        'EXPERTS CLAIM' <variable-name> 'TO BE' <value>
   }

    rule function-call {
        <function-name> <variable-name>
    }

    rule value {
        | <Number>
    }

    token variable-name {
        \w+
    }

    token function-name {
        'YOU WON\'T WANT TO MISS'
    }

    #number
    token Number {
        <sign>? [
        | <integer>
        | <floating-point>
        ] <exponent>?
    }

    token sign {
        <[+-]>
    }

    token exp {
        <[eE]>
    }

    token integer {
        \d+
    }

    token floating-point {
        <integer>? ['.' <integer>]
    }

    token exponent {
        <exp> <sign>? <integer>
    }
}