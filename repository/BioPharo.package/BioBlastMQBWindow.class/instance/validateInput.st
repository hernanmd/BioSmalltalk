private
validateInput
	" Private - Set the receiver to an invalid execution state if input is incorrect "

	self queryManager hasBlastInputs
		ifFalse: [ 
			self queryManager disableExecution.
			self inform: 'Please select a Blast XML file from the File->Open menu' translated ].