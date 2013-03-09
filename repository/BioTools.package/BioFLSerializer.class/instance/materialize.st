accessing
materialize
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ Cursor read showWhile: [ 	
					(Smalltalk at: #FLMaterializer) materializeFromFileNamed: self location ] ]
		ifFalse: [ self error: self location , ' is not a valid file for materialization' translated ]