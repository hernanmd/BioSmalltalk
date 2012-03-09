private
executeQuery: aClient
	" Private - Perform again a request "

	self reader selectStatus
		ifTrue: [ 
			self result: ( BioNCBIBlastReader newFrom: self ).
			self beSuccess.
			self gtLog: 'Finished successfully' translated ]
		ifFalse: [ 
			self executeTryRequest: aClient ].
