accessing
consensusStrategy

	^ consensusStrategy
		ifNil: [ consensusStrategy := self defaultConsensusStrategy ]