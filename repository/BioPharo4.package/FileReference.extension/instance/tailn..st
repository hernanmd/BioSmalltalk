*BioPharo4
tailn: aNumber
	" This performs the same operation as the command tail -n +aNumber on the receiver.
	It does not depend of structure of lines (i.e. #skipHeader) "

	| stream |
	stream := self contents readStream.
	aNumber - 1 timesRepeat: [ stream nextLine ].
	^ stream upToEnd