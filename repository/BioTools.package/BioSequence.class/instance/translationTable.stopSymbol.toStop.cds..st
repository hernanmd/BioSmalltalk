accessing private - protein synthesis
translationTable: aTableIdentifier stopSymbol: stopCharacter toStop: stopBoolean cds: cdsBoolean

	| seqStream codon |
	
	seqStream := WriteStream on: String new.
	( cdsBoolean and: [ self canTranslate ] )
		ifTrue: [ 
			seqStream 
				nextPutAll: ( ( seq allButLast: 3 ) allButFirst: 3 );
				nextPut: $M ].
	1 to: seq size by: 3 do: [: startIndex |
		startIndex + 2 <= seq size ifFalse: [ ^ seqStream contents ].
		codon := seq copyFrom: startIndex to: startIndex + 2.
		( self codonTables isStopCodon: codon )
			ifTrue: [ 
				cdsBoolean ifTrue: [ ^ self signalInvalidObject: 'Extra in frame stop codon found' ].
				stopBoolean ifTrue: [ ^ seqStream contents ].
				seqStream nextPut: stopCharacter ]
			ifFalse: [ seqStream nextPutAll: ( self codonTables translate: codon ) ] ].
	^ seqStream contents
	