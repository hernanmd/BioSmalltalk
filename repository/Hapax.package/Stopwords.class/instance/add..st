adding
add: aString 

	| size |
	size := aString size.
	array ifNil: [ array := Array new ].
	size > array size ifTrue: [ 
		array changeSizeTo: size. 
		array doWithIndex: [ :each :index |
			each ifNil: [ array at: index put: Array new ]]].
	array at: size put: ((array at: size) copyWith: aString).
	^aString