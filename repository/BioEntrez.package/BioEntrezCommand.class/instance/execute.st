accessing private
execute
	" Execute the receiving action. Answer a BioESearchResult "

	^ self checkParameters
		ifTrue: [ 
			self client 
				cmdName: self baseUrl;
				execute ]
		ifFalse: [ self signalInvalidObject: 'Invalid or insufficient parameters' translated ]
