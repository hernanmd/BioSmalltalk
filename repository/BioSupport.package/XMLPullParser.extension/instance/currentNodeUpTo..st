*biosupport
currentNodeUpTo: aTagString
	" Answer an Association "

	| tag |
	
	[ self isTag and: [ ( self isStartTag: aTagString ) not ]]
		whileTrue: [ 
			tag := self tag.
			self next ].
	^ self currentText isEmpty
		ifFalse: [ tag name -> self currentText ]
		ifTrue: [ nil ]