report
extractGeneAnnotFromRecord: aString 

	self halt.
	(aString splitOn: ' /// ') do: [ : ann |
		| annots |
		annots := ann splitOn: ' // '.
		self families
			detect: [ : e | e = (annots at: 2) ]
			ifFound: [ : e | self familyDictionary 
						at: e 
						put: annots first ]
			ifNone: [ self halt ] ].