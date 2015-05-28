accessing public
fileName
	^ fileName
		ifNil: [ fileName := self name , '.' , self projectFileExtension. ]