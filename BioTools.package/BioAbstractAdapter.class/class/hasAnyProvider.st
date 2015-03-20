testing
hasAnyProvider
	" Answer <true> if the receiver is available in this system "
	
	^ self allFinalClasses anySatisfy: [ : cls | cls providerIsAvailable ]