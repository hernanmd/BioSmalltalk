private
execNameFor: aString
	" Answer a String with the fully qualified name for programName, i.e. if programName is 'blast' then in Windows family the answer will be 'blast.exe' " 
	
	^ BioExecutionEngine execNameFor: aString
