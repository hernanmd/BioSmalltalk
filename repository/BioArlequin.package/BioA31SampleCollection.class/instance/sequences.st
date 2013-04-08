accessing
sequences
	" Answer a Collection of the receiver's sequence strings "

	^ self samples collect: [ : smp | smp sequenceString ]