accessing private
execute
	"Execute the receiving action. Answer a GTSearchResult object "

	^ self checkParameters
		ifTrue: [ self client execute ]
		ifFalse: [ self signalInvalidObject: 'Invalid or insufficient parameters' translated ]