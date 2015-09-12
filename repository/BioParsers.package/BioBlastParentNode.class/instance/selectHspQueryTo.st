extracting - hsps
selectHspQueryTo
	" - "
	
	^ self hspQueryTo size > 1
		ifFalse: [ self hspQueryTo anyOne blastValue ]
		ifTrue: [ (self hspQueryTo detectMax: [ : hspq | hspq blastValue size ]) blastValue ]
