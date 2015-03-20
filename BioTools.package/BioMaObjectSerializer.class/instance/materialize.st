accessing
materialize
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ Cursor read showWhile: [ self serializer fileIn: (self fileDirectoryClass forFileName: self locationString) ] ]
		ifFalse: [ self signalInvalidObject: self location , ' is not a valid file for materialization' translated ]