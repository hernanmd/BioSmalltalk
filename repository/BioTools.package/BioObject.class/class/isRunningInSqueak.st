testing
isRunningInSqueak
	" Answer <true> if the host system is running Squeak Smalltalk "

	^ Smalltalk image version beginsWith: 'Squeak'