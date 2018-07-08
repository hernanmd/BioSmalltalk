testing
testEscapeDelimiters01

	self assert: formatter delimiterSourceCharacter equals: $;.
	self assert: formatter delimiterTargetCharacter equals: $,.
	
	self assert: (formatter escapeDelimiters: 'normal text') equals: 'normal text'.
	self assert: (formatter escapeDelimiters: 'normal;text') equals: 'normal,text'.
	self assert: (formatter escapeDelimiters: ';normal;text;') equals: ',normal,text,'.		
	self assert: (formatter escapeDelimiters: ';;;;') equals: ',,,,'.
	self assert: (formatter escapeDelimiters: String empty) equals: String empty.	
	
	formatter delimiterSourceCharacter: $|.	

	self assert: (formatter escapeDelimiters: 'normal text') equals: 'normal text'.
	self assert: (formatter escapeDelimiters: 'normal|text') equals: 'normal,text'.
	self assert: (formatter escapeDelimiters: '|normal|text|') equals: ',normal,text,'.		
	self assert: (formatter escapeDelimiters: '||||') equals: ',,,,'.
	self assert: (formatter escapeDelimiters: String empty) equals: String empty.	

	formatter delimiterTargetCharacter: $M.
	
	self assert: (formatter escapeDelimiters: 'normal text') equals: 'normal text'.
	self assert: (formatter escapeDelimiters: 'normal|text') equals: 'normalMtext'.
	self assert: (formatter escapeDelimiters: '|normal|text|') equals: 'MnormalMtextM'.	
	self assert: (formatter escapeDelimiters: '||||') equals: 'MMMM'.
	self assert: (formatter escapeDelimiters: String empty) equals: String empty.	