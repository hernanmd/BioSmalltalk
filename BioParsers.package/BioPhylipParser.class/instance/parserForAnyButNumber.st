accessing-private
parserForAnyButNumber

	^ #digit asParser negate plus , #number asParser ==> [: n | n second ] 