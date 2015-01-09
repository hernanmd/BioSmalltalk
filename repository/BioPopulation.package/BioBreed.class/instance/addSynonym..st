accessing
addSynonym: synString
	" Add synString as receiver's synonym "
	
	self synonyms 
		add: synString;
		yourself.