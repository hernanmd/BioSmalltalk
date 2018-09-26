accessing
colorSet: colorSetSym
	" Answer a <Collection> with <Color> elements to be applied to each of the receiver's letters. The code relies on the #defaultColiors set of methods implemented in Color class. These methods answer a <Collection> with color names as symbols representing a Color implemented in class side. The Collection currently returns the color name every 5 elements, remaining elements are RGB values. "
	
	^ (((Color perform: colorSetSym) atAll: (
		(1 to: (Color perform: colorSetSym) size by: 4) asArray))
			first: self codes size) collect: [ : colorSym | 
				Color perform: colorSym ].