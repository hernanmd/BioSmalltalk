accessing
motif: aString
	" See comment in #sequence: "
	
	self assert: [ aString size between:  self minMotifSize and: self maxMotifSize ] description: 'Repeat sequence range check'.
	self sequence: aString