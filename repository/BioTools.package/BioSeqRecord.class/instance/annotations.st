accessing - sequence annotations
annotations

	^ annotations
		ifNil: [ annotations := self annotationsClass new ]