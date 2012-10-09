accessing-private
firstLineTokenizer
	" Answer a Parser for parsing the first line of the format "
	
	^ (self parserForNumber / self parserForAnyButNumber) ,
		(self parserForAnyButNumber) ,
		( #blank asParser star optional answer: nil ) ,
		( #newline asParser answer: nil ) ==> [ : node | node copyWithout: nil ]