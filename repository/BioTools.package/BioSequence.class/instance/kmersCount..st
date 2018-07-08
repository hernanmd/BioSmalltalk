accessing
kmersCount: patString
	" Answer the number of times that k-mers patString appears as substring of the receiver "
	
	^ (1 to: self size - patString size + 1) count: [ : i |
		(self copyFrom: i to: i + patString size - 1) sequence = patString ].