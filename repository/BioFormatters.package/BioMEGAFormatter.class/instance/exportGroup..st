exporting
exportGroup: anAssociation 

	| megaRecords |
	" Divide sequences in 80-column group"
	megaRecords := OrderedCollection new.
	anAssociation value associationsDo: [ : groupAssoc |
		megaRecords add: (
			self 
				buildMEGARecordId: (self bestNameFor: groupAssoc) 
				sequence: groupAssoc key) ].
	self exportMegaRecords: megaRecords.