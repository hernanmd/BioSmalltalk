*BioTools
isXML
	" Only answer <true> when the receiver's contents *looks like* XML, not performing any validity check "
	
	^ self beginsWith: '<?xml'