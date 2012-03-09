accessing-blast-items
padAlignmentIn: hit
	" Private - See comment in #paddedAlignments "

	| qFrom qTo correctedSeq |

	qFrom := self hspQueryFromFrom: hit.
	qTo := self hspQueryToFrom: hit.
	correctedSeq := self hspHSeqFrom: hit.

	qFrom ~= 1 
		ifTrue: [ correctedSeq := ( self generateJoin: $? repeat: qFrom - 1 ) , correctedSeq ].
	qTo < self querySeq size 
		ifTrue: [ correctedSeq := correctedSeq , ( self generateJoin: $? repeat: self querySeq size - qTo )  ].

	^ correctedSeq