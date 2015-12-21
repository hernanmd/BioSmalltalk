accessing private
sameSequence
	" Answer a <String> with the same letter used in all receiver's positions "
	
	^ String streamContents: [ : stream |
		size timesRepeat: [ stream nextPut: self unknownLetter ] ]