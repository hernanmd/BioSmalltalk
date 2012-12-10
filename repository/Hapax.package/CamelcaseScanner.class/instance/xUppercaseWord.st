private
xUppercaseWord

	[	| peek |
		peek := stream peek.
		next isLetter and: [ 
		peek == nil or: [ peek isLowercase not ]]] whileTrue: [ 
			buffer nextPut: next. next := stream next. ]