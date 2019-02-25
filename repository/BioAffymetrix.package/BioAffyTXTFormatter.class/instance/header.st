accessing-header
header
	^ header
		ifNil: [ header := self readHeader ]