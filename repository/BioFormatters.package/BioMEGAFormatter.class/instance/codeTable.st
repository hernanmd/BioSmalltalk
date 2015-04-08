accessing
codeTable
	" Answer a <String> "
	^ codeTable
		ifNil: [ self setCodeTableAsStandard.
			codeTable ]