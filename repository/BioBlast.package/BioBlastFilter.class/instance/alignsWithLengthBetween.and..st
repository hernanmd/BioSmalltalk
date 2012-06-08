filtering-blast-alignments
alignsWithLengthBetween: minAlignLength and: maxAlignLength
	" Answer a filter with the receiver's hit nodes which were identities are aligned between maxAlignLength and minAlignLength "
	<userComment: 'Select hits with alignments between a given range. In the BlastOutput XML file it matches with the Hsp_align-len node. The Hsp_align-len is an integer value which contains the length of the alignment used. If there are multiple HSPs, this will answer a Number with the one with the highest alignment. Examples:
	
	( aBioBlastFilter alignsWithLengthBetween: 235 and: 240 ) ==> '>

	| collection |
	collection := self hits
		select: [ :node | 
			| alignSize |
			alignSize := node selectHspAlign.
			alignSize >= minAlignLength and: [ alignSize <= maxAlignLength ] ].
	^ self addFilteredResultsFrom: collection