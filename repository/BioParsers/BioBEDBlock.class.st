"
A single exon block within a BED12 feature. Each block represents a sub-interval (typically an exon) described by its relative start position (from the feature start) and its size. Instance Variables: start <Integer> Relative start position (0-based). size <Integer> Size of the block in bases.
"
Class {
	#name : 'BioBEDBlock',
	#superclass : 'Object',
	#instVars : [
		'start',
		'size'
	],
	#category : 'BioParsers-BED',
	#package : 'BioParsers',
	#tag : 'BED'
}

{ #category : 'as yet unclassified' }
BioBEDBlock class >> start: anInt size: sizeInt [ ^ self new start: anInt; size: sizeInt; yourself
]

{ #category : 'initialization' }
BioBEDBlock >> initialize [ super initialize. start := 0. size := 0
]

{ #category : 'accessing' }
BioBEDBlock >> size [ ^ size
]

{ #category : 'accessing' }
BioBEDBlock >> size: anInteger [ size := anInteger
]

{ #category : 'accessing' }
BioBEDBlock >> start [ ^ start
]

{ #category : 'accessing' }
BioBEDBlock >> start: anInteger [ start := anInteger
]
