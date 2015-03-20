accessing parser
accessNodes: aNodeName
	" Private - Answer a Collection with search results corresponding to aNodeName
	or raise an exception if there are no results in the receiver "
	
	| qResult |
	^ (qResult := self 
			selectNodes: (Array with: aNodeName)
			in: self results) isEmpty
				ifFalse: [ qResult ]
				ifTrue: [ self signalInvalidObject: 'Empty result set' translated ]