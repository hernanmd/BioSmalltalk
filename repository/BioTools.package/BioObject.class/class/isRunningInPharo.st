testing
isRunningInPharo
	" Answer <true> if the host system is running Pharo Smalltalk "

	^ Smalltalk image version beginsWith: 'Pharo'