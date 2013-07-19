accessing
selectHspAlignLengths
	
	^ self hits collect: [: h | h hspAlignLengths blastValue]