accessing
allCodes
	" Answer a Collection with all biologically relevant letters "
	
	^ (self allFinalClasses collect: #codes) joinUsing: String empty