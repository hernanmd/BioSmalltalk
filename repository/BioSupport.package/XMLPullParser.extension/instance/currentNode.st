*biosupport
currentNode
	" Answer an Association "

	| tag |
	
	[ self isTag ]
		whileTrue: [ 
			tag := self tag.
			self next ].
	^ self currentText isEmpty
		ifFalse: [ tag name -> self currentText ]
		ifTrue: [ self error ]