accessing
addBlast: blastContents

	(self blastCollection includes: blastContents)
		ifFalse: [ self blastCollection add: blastContents]
		ifTrue: [ self inform: 'Blast already loaded' translated ]