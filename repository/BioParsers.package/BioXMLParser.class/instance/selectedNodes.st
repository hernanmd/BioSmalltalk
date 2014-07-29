accessing
selectedNodes

	^ nodes
		ifNil: [ nodes := self defaultNodes ]