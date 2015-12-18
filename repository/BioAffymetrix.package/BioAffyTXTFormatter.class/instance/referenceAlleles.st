accessing
referenceAlleles
	" Answer a <Collection> with receiver's reference alleles "

	| txtArray refAlleleIndex |
	txtArray := self buildTXTArray.
	refAlleleIndex := txtArray first 
		indexOf: self refAlleleFieldName 
		ifAbsent: [ self signalNotFound: self refAlleleFieldName , ' field not found' ].
	^ (txtArray collect: [ : row | row at: refAlleleIndex ]) allButFirst
	