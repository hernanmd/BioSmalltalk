defaults
maxMotifSize
	" See comment in #defaultMotifRange "
	
	^ maxMotifSize
		ifNil: [ maxMotifSize := self defaultMaxMotifSize ]