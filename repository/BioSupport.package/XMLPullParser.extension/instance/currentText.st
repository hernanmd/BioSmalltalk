*biosupport
currentText
	^ self isText 
		ifTrue: 
			[| text |
			text := self current text.
			text]
		ifFalse: ['']