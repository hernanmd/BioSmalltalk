report
extractMinAlleleFrqsFromRecordInitFamDictionary: aString 

	(aString splitOn: ' /// ') do: [ : fqs |
		| frqs |
		frqs := fqs splitOn: ' // '.
		self families
			detect: [ : e | e = (frqs at: 2) ]
			ifFound: [ : e | self familyDictionary 
						at: e 
						put: frqs first ]
			ifNone: [ self halt ] ].