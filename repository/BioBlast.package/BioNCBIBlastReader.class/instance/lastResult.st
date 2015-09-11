accessing
lastResult
	" Answer the last <BioResultObject> in chronological order "

	^ results detectMax: [ : r | r date ]