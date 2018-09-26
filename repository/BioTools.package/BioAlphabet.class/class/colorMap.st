accessing
colorMap
	" Answer a <Dictionary> with mappings of each receiver's letter to an instance of <Color>  "
	
	^ (((Color defaultColors2 atAll: (
		(1 to: Color defaultColors2 size by: 4) asArray))
			first: self codes size) 
				with: self codes 
				collect: [ : colorSym : letter | letter -> (Color perform: colorSym) ]) asDictionary.