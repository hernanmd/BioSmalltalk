"
ESummary now supports a new, alternative XML presentation for Entrez document summaries (DocSums). The new XML is unique to each Entrez database and generally contains more extensive data about the record than the original DocSum XML.

There are no plans at present to discontinue the original DocSum XML, so developers can continue to use this presentation, which will remain the default.

Version 2.0 XML is returned when &version=2.0 is included in the ESummary URL.



"
Class {
	#name : #BioESummaryAlternative,
	#superclass : #BioESummary,
	#category : 'BioEntrez-Commands'
}

{ #category : #'accessing private' }
BioESummaryAlternative >> execute [
	"Execute the receiving action. Answer a BioESearchResult "

	^ self checkParameters
		ifTrue: [ 
			self client 
				cmdName: self baseUrl;
				queryAt: 'version' put: '2.0';
				execute ]
		ifFalse: [ self signalInvalidObject: 'Invalid or insufficient parameters' translated ]
]
