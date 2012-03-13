convenience-filtering
filterSequence: referenceChar using: hitChar in: stream
	" Private - This is specialized for Arlqeuin format right now.
		Append a separator to the stream sequence and the referenceChar or hitChar.
		If hitChar = '.' then sequence are equal in that position and append the referenceChar
		If hitChar <> '.' then sequence are not equal and append the hitChar found "

	^ hitChar size = 1 
		ifTrue: [ 
			self appendSeparatorTo: stream.
			hitChar = '.'
				ifTrue: [ stream nextPut: referenceChar ] 
				ifFalse: [ stream nextPutAll: hitChar ] ]
		ifFalse: [ self halt ]
