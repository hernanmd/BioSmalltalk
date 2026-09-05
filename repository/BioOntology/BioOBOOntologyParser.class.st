Class {
	#name : 'BioOBOOntologyParser',
	#superclass : 'BioOntologyParser',
	#category : 'BioOntology-Parsers',
	#package : 'BioOntology',
	#tag : 'Parsers'
}

{ #category : 'private' }
BioOBOOntologyParser >> extractQuoted: aString [

	| start stop |
	start := aString indexOf: $".
	start = 0 ifTrue: [ ^ aString ].
	stop := aString indexOf: $" startingAt: start + 1.
	stop = 0 ifTrue: [ ^ aString copyFrom: start + 1 to: aString size ].
	^ aString copyFrom: start + 1 to: stop - 1
]

{ #category : 'parsing' }
BioOBOOntologyParser >> parse: aString [
	| onto stanzas |
	onto := BioOntology new.
	stanzas := self splitStanzas: aString.
	stanzas do: [:stanza |
		| type |
		type := self stanzaType: stanza.
		type = 'Term' ifTrue: [| term | term := self parseTermStanza: stanza. term ifNotNil: [onto addTerm: term]].
		type = 'Typedef' ifTrue: [onto addRelationship: (self parseTypedefStanza: stanza)].
		type = 'header' ifTrue: [self parseHeader: stanza into: onto] ].
	self resolveParents: onto.
	^ onto

]

{ #category : 'parsing' }
BioOBOOntologyParser >> parseHeader: aStanza into: onto [
	| lines |
	lines := aStanza findTokens: (String with: Character cr).
	lines do: [:line | | sepIdx key value |
		sepIdx := line indexOf: $:.
		sepIdx > 0 ifTrue: [
			key := (line copyFrom: 1 to: sepIdx - 1) trimBoth.
			value := (line copyFrom: sepIdx + 1 to: line size) trimBoth.
			key = 'ontology' ifTrue: [onto id: value].
			key = 'data-version' ifTrue: [onto version: value].
			onto metadataAt: key put: value ] ]

]

{ #category : 'parsing' }
BioOBOOntologyParser >> parseTermStanza: aStanza [
	| term lines |
	term := BioOntologyTerm new.
	lines := aStanza findTokens: (String with: Character cr).
	lines do: [:line | | sepIdx key value |
		sepIdx := line indexOf: $:.
		sepIdx > 0 ifTrue: [
			key := (line copyFrom: 1 to: sepIdx - 1) trimBoth.
			value := (line copyFrom: sepIdx + 1 to: line size) trimBoth.
			self setTerm: term key: key value: value ] ].
	term id ifNil: [ ^ nil ].
	^ term

]

{ #category : 'parsing' }
BioOBOOntologyParser >> parseTypedefStanza: aStanza [
	| rel lines |
	rel := BioOntologyRelationship new.
	lines := aStanza findTokens: (String with: Character cr).
	lines do: [:line | | sepIdx key value |
		sepIdx := line indexOf: $:.
		sepIdx > 0 ifTrue: [
			key := (line copyFrom: 1 to: sepIdx - 1) trimBoth.
			value := (line copyFrom: sepIdx + 1 to: line size) trimBoth.
			key = 'id' ifTrue: [rel predicate: value asSymbol]] ].
	^ rel

]

{ #category : 'private' }
BioOBOOntologyParser >> resolveParents: onto [
	onto terms do: [:t |
		| resolved |
		resolved := OrderedCollection new.
		t parents do: [:rel |
			rel object isString ifTrue: [
				| parentTerm |
				parentTerm := onto termById: rel object.
				parentTerm ifNotNil: [
					| newRel |
					newRel := BioOntologyRelationship subject: t predicate: rel predicate object: parentTerm.
					resolved add: newRel.
					parentTerm addChild: (BioOntologyRelationship subject: t predicate: rel predicate object: parentTerm) ] ] ].
		t parents: resolved ]

]

{ #category : 'initialization' }
BioOBOOntologyParser >> setTerm: term key: key value: value [

	key = 'id' ifTrue: [
			term id: value.
			^ self ].
	key = 'name' ifTrue: [
			term name: value.
			^ self ].
	key = 'namespace' ifTrue: [
			term namespace: value.
			^ self ].
	key = 'def' ifTrue: [
			term definition: (self extractQuoted: value).
			^ self ].
	key = 'is_obsolete' ifTrue: [
			term isObsolete: (value beginsWith: 'true').
			^ self ].
	key = 'replaced_by' ifTrue: [
			term isReplacedBy: value.
			^ self ].
	key = 'consider' ifTrue: [
			term addConsider: value.
			^ self ].
	key = 'xref' ifTrue: [
			term addCrossReference: value.
			^ self ].
	key = 'is_a' ifTrue: [
			| parentId |
			parentId := (value copyUpTo: $!) trimBoth.
			term addParent: (BioOntologyRelationship
					 subject: term
					 predicate: #is_a
					 object: parentId).
			^ self ].
	key = 'relationship' ifTrue: [
			| tokens |
			tokens := value findTokens: ' '.
			tokens size >= 2 ifTrue: [
					term addParent: (BioOntologyRelationship
							 subject: term
							 predicate: tokens first asSymbol
							 object: tokens second trimBoth) ].
			^ self ].
	key = 'synonym' ifTrue: [
			| txt typ |
			txt := self extractQuoted: value.
			typ := (value includesSubstring: 'EXACT')
				       ifTrue: [ 'exact' ]
				       ifFalse: [
						       (value includesSubstring: 'BROAD')
							       ifTrue: [ 'broad' ]
							       ifFalse: [
									       (value includesSubstring: 'NARROW')
										       ifTrue: [ 'narrow' ]
										       ifFalse: [ 'related' ] ] ].
			term addSynonym: txt type: typ.
			^ self ].
	key = 'alt_id' ifTrue: [
			term dataAt: 'alt_id' put: value.
			^ self ].
	key = 'comment' ifTrue: [
			term dataAt: 'comment' put: value.
			^ self ].
	key = 'subset' ifFalse: [ ^ self ].
	term dataAt: 'subset' put: value.
	^ self
]

{ #category : 'private' }
BioOBOOntologyParser >> splitStanzas: aString [
	| result current lines |
	result := OrderedCollection new.
	current := (String new: 500) writeStream.
	lines := aString findTokens: (String with: Character cr with: Character lf).
	lines do: [:line |
		(line beginsWith: '[')
			ifTrue: [
				current contents trimBoth isEmpty ifFalse: [result add: current contents].
				current := (String new: 500) writeStream.
				current nextPutAll: line; cr ]
			ifFalse: [
				line trimBoth isEmpty ifFalse: [current nextPutAll: line; cr] ] ].
	current contents trimBoth isEmpty ifFalse: [result add: current contents].
	^ result

]

{ #category : 'private' }
BioOBOOntologyParser >> stanzaType: aStanza [

	(aStanza beginsWith: '[Term]') ifTrue: [ ^ 'Term' ].
	(aStanza beginsWith: '[Typedef]') ifTrue: [ ^ 'Typedef' ].
	(aStanza includesSubstring: '[') ifFalse: [ ^ 'header' ].
	^ 'unknown'
]
