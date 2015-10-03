accessing
consensusAt: aString

	^ 'ACGTUN-' detectMax: [ : letter | aString instancesOf: letter ]