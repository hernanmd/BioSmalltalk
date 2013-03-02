accessing
materialize
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ 
			self provider: (self provider readOnlyFileNamed: self location).
			self provider fileInObjectAndCode ]
		ifFalse: [ self signalInvalidObject: self location , ' is not a valid file for materialization' translated ]

