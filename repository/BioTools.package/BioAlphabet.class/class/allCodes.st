accessing
allCodes
	" Answer a Collection with all biologically relevant letters "
	
	^ ( self allFinalClasses collect: [: cls | cls codes ] ) joinUsing: String empty