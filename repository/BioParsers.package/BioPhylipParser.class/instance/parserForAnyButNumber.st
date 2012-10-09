accessing-private
parserForAnyButNumber

	^ #digit asParser negate plus , self parserForNumber ==> [: n | n second ] 