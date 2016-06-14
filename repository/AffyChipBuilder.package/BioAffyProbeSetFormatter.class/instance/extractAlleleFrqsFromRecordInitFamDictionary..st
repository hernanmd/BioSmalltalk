report
extractAlleleFrqsFromRecordInitFamDictionary: aString 

	(aString splitOn: ' /// ') do: [ : fqs |
		| frqs |
		frqs := fqs splitOn: ' // '.
		self families
			detect: [ : e | e = (frqs at: 3) ]
			ifFound: [ : e | self familyDictionary 
						at: e 
						put: frqs first -> frqs second ]
			ifNone: [ self halt ] ].