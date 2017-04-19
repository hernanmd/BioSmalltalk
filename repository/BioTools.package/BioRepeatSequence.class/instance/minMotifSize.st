defaults
minMotifSize
	" See comment in #defaultMotifRange "
	
	^ minMotifSize
		ifNil: [ minMotifSize := self defaultMinMotifSize ]