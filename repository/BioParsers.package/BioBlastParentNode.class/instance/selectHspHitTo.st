extracting - hsps
selectHspHitTo
	" - "

	^ self hspHitTo size > 1
		ifFalse: [ self hspHitTo anyOne blastValue ]
		ifTrue: [ (self hspHitTo detectMax: [ : hspHitFrom | hspHitFrom blastValue size ]) blastValue ]

