accessing-sequence
annotations

	^ annotations
		ifNil: [ annotations := self annotationsClass new ]