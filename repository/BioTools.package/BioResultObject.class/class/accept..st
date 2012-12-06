accessing
accept: anObject
	" Answer <true> if anObject can be instantiated with the receiver "

	^ anObject respondsTo: #addResult:.