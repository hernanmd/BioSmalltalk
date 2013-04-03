accessing
defaultAction
	"The default action taken if the exception is signaled."

	self useLogger
		ifTrue: [ self logger add: self ].
	self showWarning 
		ifTrue: [ self bioLog: self messageText ].
	self raiseWarning 
		ifTrue: [ BioObject alert: self messageText ].
	^ nil