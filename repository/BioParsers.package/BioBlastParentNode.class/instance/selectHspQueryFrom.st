extracting - hsps
selectHspQueryFrom
	" Answer the start of HSP in query"

	^ self hspQueryFrom size > 1
		ifFalse: [ self hspQueryFrom anyOne blastValue ]
		ifTrue: [ (self hspQueryFrom detectMax: [ : hspq | hspq blastValue size ]) blastValue ]
