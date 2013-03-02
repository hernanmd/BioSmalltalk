accessing
materialize
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ self serializer fileIn: (self fileDirectoryClass forFileName: self locationString) ]
		ifFalse: [ self signalInvalidObject: self location , ' is not a valid file for materialization' translated ]