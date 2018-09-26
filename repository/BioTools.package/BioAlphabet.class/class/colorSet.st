accessing
colorSet
	" See comment in #colorSet: "
	
	^ ((Color defaultColors3 atAll: (
		(1 to: Color defaultColors3 size by: 4) asArray))
			first: self codes size) collect: [ : colorSym | 
				Color perform: colorSym ].