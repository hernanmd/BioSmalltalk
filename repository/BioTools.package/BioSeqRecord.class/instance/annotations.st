accessing - sequence annotations
annotations
	" Answer a <Collection> with receiver's annotations "

	^ annotations
		ifNil: [ annotations := self annotationsClass new ]