accessing
materialize
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ Cursor read showWhile: [ 	
					(self classFor: #FLMaterializer) materializeFromFileNamed: self location ] ]
		ifFalse: [ self error: self location , ' is not a valid file for materialization' translated ]