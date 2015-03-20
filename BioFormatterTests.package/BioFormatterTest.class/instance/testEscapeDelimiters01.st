testing
testEscapeDelimiters01

	self assert: formatter delimiterSourceCharacter = $;.
	self assert: formatter delimiterTargetCharacter = $,.
	
	self assert: ( formatter escapeDelimiters: 'normal text' ) = 'normal text'.
	self assert: ( formatter escapeDelimiters: 'normal;text' ) = 'normal,text'.
	self assert: ( formatter escapeDelimiters: ';normal;text;' ) = ',normal,text,'.		
	self assert: ( formatter escapeDelimiters: ';;;;' ) = ',,,,'.
	self assert: ( formatter escapeDelimiters: String empty ) = String empty.	
	
	formatter delimiterSourceCharacter: $|.	

	self assert: ( formatter escapeDelimiters: 'normal text' ) = 'normal text'.
	self assert: ( formatter escapeDelimiters: 'normal|text' ) = 'normal,text'.
	self assert: ( formatter escapeDelimiters: '|normal|text|' ) = ',normal,text,'.		
	self assert: ( formatter escapeDelimiters: '||||' ) = ',,,,'.
	self assert: ( formatter escapeDelimiters: String empty ) = String empty.	

	formatter delimiterTargetCharacter: $M.
	
	self assert: ( formatter escapeDelimiters: 'normal text' ) = 'normal text'.
	self assert: ( formatter escapeDelimiters: 'normal|text' ) = 'normalMtext'.
	self assert: ( formatter escapeDelimiters: '|normal|text|' ) = 'MnormalMtextM'.	
	self assert: ( formatter escapeDelimiters: '||||' ) = 'MMMM'.
	self assert: ( formatter escapeDelimiters: String empty ) = String empty.	