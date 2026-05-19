"
A minimal SmaCC scanner providing infrastructure for BioMAFSmaCCParser. Since the MAF SmaCC parser reads lines directly from the stream and splits on tabs, this scanner does not perform traditional tokenization. It exists to satisfy the SmaCC class hierarchy contract.

See also: BioMAFSmaCCParser
"
Class {
	#name : 'BioMAFScanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'accessing' }
BioMAFScanner >> emptySymbol [ ^ #empty
]

{ #category : 'accessing' }
BioMAFScanner >> errorSymbol [ ^ #error
]

{ #category : 'accessing' }
BioMAFScanner >> scanForToken [ ^ SmaCCToken value: (String new) start: stream position stop: stream position
]
