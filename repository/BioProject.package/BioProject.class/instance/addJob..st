accessing-sequences
addJob: aBioJob
	" Add aBioJob to the receiver's jobs "
	
	^ self jobs addLast: aBioJob; yourself