exporting
exportGroup: anAssociation 
	" Private - Iterate over anAssociation, build and export the MegaRecords in proper format "
	
	| megaRecords |
	
	" Divide sequences in 80-column group"
	megaRecords := OrderedCollection new.
	self halt.
	anAssociation value associationsDo: [ : groupAssoc |
		megaRecords add: (
			self 
				buildMEGARecordId: (self bestNameFor: groupAssoc) 
				sequence: groupAssoc key) ].
	^ megaRecords