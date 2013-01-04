accessing
outputSynonymsTo: aStream
	" Private - See comment in #outputAsCsvTo: "

	self synonyms isEmpty
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ 
			self synonyms do: [ : each | aStream nextPutAll: each; nextPut: $, ].
			aStream back ].
	aStream nextPut: $;.