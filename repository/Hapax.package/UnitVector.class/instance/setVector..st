initialize-release
setVector: aVector

	length := aVector length.
	length isZero 
		ifTrue: [ vector := Vector new: aVector size withAll: 0. ]
		ifFalse: [ vector := (Vector new: aVector size) putWithIndex: [ :each | (aVector at: each) / length ]].