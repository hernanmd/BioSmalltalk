accessing-blast-items
padAlignmentIn: hit
	" Private - See comment in #paddedAlignments "

	| qFrom qTo correctedSeq |

	qFrom := self hspQueryFromFrom: hit.
	qTo := self hspQueryToFrom: hit.
	correctedSeq := self hspHSeqFrom: hit.

	qFrom ~= 1 
		ifTrue: [ correctedSeq := ( BioObject generateJoin: $? repeat: qFrom - 1 ) , correctedSeq ].
	self querySeq isNil
		ifTrue: [ self error: 'Missing reference (query) sequence' ].
	qTo <  self querySeq size 
		ifTrue: [ correctedSeq := correctedSeq , ( BioObject generateJoin: $? repeat: self querySeq size - qTo )  ].

	^ correctedSeq