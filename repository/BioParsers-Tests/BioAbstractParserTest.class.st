"
Abstract test class for BioSmalltalk parsers. Provides common test infrastructure, fixture accessors, and helper methods for parser test subclasses.
"
Class {
	#name : 'BioAbstractParserTest',
	#superclass : 'BioAbstractTest',
	#instVars : [
		'parser',
		'parseResult'
	],
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'accessing' }
BioAbstractParserTest >> parser [

	^ parser
]

{ #category : 'accessing' }
BioAbstractParserTest >> parserClass [

	^ BioParser
]
