*bioparsers
includesTag: aTagCollection
	" Answer <true> if current tag is included in aTagCollection "

	^ aTagCollection anySatisfy: [ : tagString | ( self isStartTag: tagString ) ]