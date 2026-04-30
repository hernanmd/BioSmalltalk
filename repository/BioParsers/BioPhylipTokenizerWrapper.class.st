Class {
	#name : 'BioPhylipTokenizerWrapper',
	#superclass : 'Object',
	#instVars : [
		'block'
	],
	#category : 'BioParsers-PHYLIP',
	#package : 'BioParsers',
	#tag : 'PHYLIP'
}

{ #category : 'accessing' }
BioPhylipTokenizerWrapper >> block: aBlock [
    block := aBlock
]

{ #category : 'parsing' }
BioPhylipTokenizerWrapper >> parse: input [
    ^ block value: input
]
