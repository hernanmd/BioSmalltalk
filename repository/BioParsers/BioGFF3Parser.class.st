Class {
	#name : 'BioGFF3Parser',
	#superclass : 'SmaCCParser',
	#category : 'BioParsers-GFF3',
	#package : 'BioParsers',
	#tag : 'GFF3'
}

{ #category : 'as yet unclassified' }
BioGFF3Parser class >> on: aStream [
    ^ self new scanner: (BioGFF3Scanner on: aStream); yourself
]

{ #category : 'accessing' }
BioGFF3Parser >> parse [

	| fileNode directiveListNode featureListNode directive directOrder featureOrder token |
	fileNode := BioGFF3GFF3FileNode new.
	directOrder := OrderedCollection new.
	featureOrder := OrderedCollection new.

	[ scanner stream atEnd ] whileFalse: [
			| line |
			line := scanner stream nextLine.
			line ifNotEmpty: [
					line first = $#
						ifTrue: [
								(line beginsWith: '##')
									ifTrue: [
											directive := BioGFF3DirectiveNode new text:
												             (SmaCCToken value: line).
											directOrder add: directive ]
									ifFalse: [ "Skip comment" ] ]
						ifFalse: [
								line first = $>
									ifTrue: [ "Skip FASTA" ]
									ifFalse: [
											token := self parseFeatureLine: line.
											token ifNotNil: [ featureOrder add: token ] ] ] ] ].

	directiveListNode := BioGFF3DirectiveListNode new.
	directiveListNode directives: directOrder.

	featureListNode := BioGFF3FeatureListNode new.
	featureListNode lines: featureOrder.

	fileNode directives: directiveListNode.
	fileNode features: featureListNode.
	^ fileNode
]

{ #category : 'parsing' }
BioGFF3Parser >> parseDirective: line [

	^ BioGFF3DirectiveNode new text: line
]

{ #category : 'parsing' }
BioGFF3Parser >> parseFeatureLine: line [

	| fields feature |
	fields := line splitOn: Character tab.
	fields size < 9 ifTrue: [ ^ nil ].
	feature := BioGFF3FeatureLineNode new.
	feature
		seqid: (SmaCCToken value: fields first);
		_source: (SmaCCToken value: (fields at: 2));
		type: (SmaCCToken value: (fields at: 3));
		start: (SmaCCToken value: (fields at: 4));
		end: (SmaCCToken value: (fields at: 5));
		score: (SmaCCToken value: (fields at: 6));
		strand: (SmaCCToken value: (fields at: 7));
		phase: (SmaCCToken value: (fields at: 8)).
	fields size >= 9 ifTrue: [
		feature _attributes: (SmaCCToken value: (fields at: 9)) ].
	^ feature
]
