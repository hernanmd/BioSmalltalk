"
A minimal SmaCC scanner providing infrastructure for the BioBEDParser. Since the BED parser reads lines directly from the stream and splits on tabs, the scanner does not perform tokenization in the traditional SmaCC sense. It exists to satisfy the SmaCC class hierarchy contract and provide consistent error reporting integration.
"
Class {
	#name : 'BioBEDScanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioParsers-BED',
	#package : 'BioParsers',
	#tag : 'BED'
}

{ #category : 'accessing' }
BioBEDScanner >> emptySymbol [ ^ #empty
]

{ #category : 'accessing' }
BioBEDScanner >> errorSymbol [ ^ #error
]

{ #category : 'accessing' }
BioBEDScanner >> scanForToken [
	self skipWhitespace.
	stream atEnd ifTrue: [ ^ SmaCCToken value: String new start: stream position stop: stream position ].
	^ SmaCCToken value: stream next asString start: stream position - 1 stop: stream position
]
