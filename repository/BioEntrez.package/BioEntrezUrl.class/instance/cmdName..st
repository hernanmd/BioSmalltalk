accessing
cmdName: aCmdString
	" Append aString as the receiver's command name "

	self buildUrl: aCmdString with: self path last.	
