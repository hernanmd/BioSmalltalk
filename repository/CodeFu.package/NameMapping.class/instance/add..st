adding
add: name 

	(self includesName: name) ifTrue: [ Error raise ].
	names addLast: name.
	^self size