accessing
executeCommand: aCommandName
	" See superimplementor's comment "
	
	^ [ self executeOSProcessCommand: aCommandName ]
		on: Warning "AioPlugin not present"
		do: [ : ex | ex resume ]