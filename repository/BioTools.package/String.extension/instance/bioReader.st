*BioTools
bioReader
	" Answer a BioReader on the receiver "
	
	| readerClass |
	
	readerClass := BioReader for: self.
	^ self isXML 
		ifTrue: [ readerClass newFromXML: self ]
		ifFalse: [ readerClass newFromFlat: self ]