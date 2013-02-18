*biosupport
currentNodeUpToAny: aTagCollection
	" Answer an Association "

	| tag |
	
	[ self atEnd not and: [self isTag and: [ (self includesTag: aTagCollection) not] ]]
		whileTrue: [ 
			tag := self tag.
			self next ].
	^ (self atEnd not and: [ self isText and: [ ( self includesTag: aTagCollection ) not ]])
		ifTrue: [ 
			self next.
			self currentNodeUpToAny: aTagCollection ]
		ifFalse: [ 
			(self atEnd not and: [self currentText isEmpty])
				ifFalse: [ 
					self atEnd 
						ifTrue: [ nil ]
						ifFalse: [ tag name -> self currentText ] ]
				ifTrue: [ 
					tag := self tag.
					self next.
					tag name -> self currentText  ] ]