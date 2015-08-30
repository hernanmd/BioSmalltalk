accessing-blast
padAlignmentIn: hit
	" Private - See comment in #paddedAlignments "

	| qFromIndex qToIndex correctedSeq |

	qFromIndex := self hspQueryFromFrom: hit.
	qToIndex := self hspQueryToFrom: hit.
	correctedSeq := self hspHSeqFrom: hit.

	qFromIndex ~= 1 
		ifTrue: [ correctedSeq := (BioObject generateJoin: $? repeat: qFromIndex - 1) , correctedSeq ].
	self hasQuerySequence 
		ifFalse: [ self error: 'Missing reference (query) sequence' ].
	qToIndex <  self querySequence size 
		ifTrue: [ correctedSeq := correctedSeq , (BioObject generateJoin: $? repeat: self querySequence size - qToIndex)  ].

	^ correctedSeq