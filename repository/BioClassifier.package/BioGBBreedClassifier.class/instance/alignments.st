accessing
alignments

	^ alignments
		ifNil: [ alignments := self reader paddedAlignments ]