private
pathTemplate: prgName
	" Answer a String with a method template to be compiled by the receiver "
	
	^ prgName , 'Path
	" Answer a String with the full path to the receiver''s binary "
	
	^  self blastNamed: ''' , prgName , ''''
