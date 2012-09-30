accessing
defaultAction

	self logException " Logger "
		ifNotNil: [:log | log add: self].
	self showWarning 
		ifTrue: [ Transcript nextPutAll: self messageText; cr; flush ].
	self raiseWarning 
		ifTrue: [ nil ]