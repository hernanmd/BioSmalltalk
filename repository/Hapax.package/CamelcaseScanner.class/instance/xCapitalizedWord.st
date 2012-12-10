private
xCapitalizedWord

	buffer nextPut: next.
	next := stream next.
	next isLetter ifTrue: [
		next isLowercase
			ifTrue: [ 
				buffer collection at: 1 put: buffer collection first asLowercase.
				self xLowercaseWord ]
			ifFalse: [ self xUppercaseWord ]]