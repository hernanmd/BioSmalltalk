accessing
defaultAction
	"The default action taken if the exception is signaled."

	self useLogger
		ifTrue: [ self logger add: self ].
	self showWarning 
		ifTrue: [ Transcript nextPutAll: self messageText; cr; flush ].
	self raiseWarning 
		ifTrue: [ BioObject alert: self messageText ].
	^nil