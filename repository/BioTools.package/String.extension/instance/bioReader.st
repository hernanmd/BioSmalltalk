*BioTools
bioReader
	" Answer a BioReader on the receiver "
	
	| readerClass |
	
	readerClass := BioAbstractReader for: self.
	^ self isXML 
		ifTrue: [ readerClass newFromXML: self ]
		ifFalse: [ readerClass newFromFlat: self ]