accessing-private
firstLineTokenizer
	" Answer a Parser for parsing the first line of the format "
	
	^ ( #digit asParser plus flatten /
	( #digit asParser negate plus , #digit asParser plus flatten ==> [: n | n second ] ) ) ,
	( #digit asParser negate plus , #digit asParser plus flatten ==> [: n | n second ] ).