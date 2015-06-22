*BioPharo4
sizeInMegabytes
	" Answer a <Number> of the receiver size in Megabytes "

	^ (self size / 1048576) asFloat roundTo: 0.01