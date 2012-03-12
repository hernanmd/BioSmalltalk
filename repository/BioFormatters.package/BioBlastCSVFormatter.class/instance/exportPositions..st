exporting
exportPositions: hitCollection
	" Private - Export a row for the sequence positions "

	| posCount |

	" Space for the first column "
	stream space.
	" How many positions to write. Needs work, this could be a user-defined range..."
	posCount := hitCollection first selectHspAlign.
	1 to: posCount do: [: i | 
		stream 
			nextPut: self delimiterSourceCharacter; 
			nextPutAll: i asString ].
	stream cr.	
