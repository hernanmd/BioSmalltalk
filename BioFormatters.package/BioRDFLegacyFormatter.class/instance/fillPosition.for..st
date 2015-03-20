populating
fillPosition: colIndex for: maxDigits
	" Private - Build a column position, answer a String 001 005 032 145 ... "
	
	| pad position |

	pad := maxDigits - colIndex numberOfDigits.
	position := ( WriteStream on: String new ) 
					nextPutAll: ( BioObject generateJoin: '0' repeat: pad );				
					nextPutAll: colIndex asString;
					yourself.
	^ position contents
