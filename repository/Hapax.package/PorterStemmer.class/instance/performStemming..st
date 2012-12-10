private-algorithm
performStemming: aString
	"Performs the Porter stemming algrothim. More see:
	M. Porter, An algorithm for suffix stripping, Program (1980)/ Vol. 14, No. 3, 130-137"

	string := aString asLowercase.
	string size > 2 ifTrue: [ 
	self 
		preprocessing;
		setMarks;
		step1a;
		step1b;
		step1c;
		step2;
		step3;
		step4;
		step5a;
		step5b ].
	string := string asLowercase.
	^string