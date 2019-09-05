Class {
	#name : #BioA31StructureSection,
	#superclass : #BioA31INISection,
	#category : 'BioArlequin-Sections'
}

{ #category : #accessing }
BioA31StructureSection class >> groupId [

	^ 'Group' -> 'The group definitions.  A list containing the names of the samples belonging to the group, entered within braces. Repeat this for as many groups you have in your structure. It is of course not allowed to put the same population in different groups. Also note that a comment sign (#) is not allowed after the opening brace and would lead to an error message. Comments about the group should therefore be done before the definition of the group. '
]

{ #category : #accessing }
BioA31StructureSection class >> nbGroupsId [

	^ 'NbGroups' -> 'The number of groups defined in the structure'
]

{ #category : #accessing }
BioA31StructureSection class >> notation [

	^ '[Structure]'
]

{ #category : #accessing }
BioA31StructureSection class >> structureNameId [

	^ 'StructureName' -> 'A name for the genetic structure'
]

{ #category : #accessing }
BioA31StructureSection >> addGroup: aString [
	" Add aString to the receiver's groups "
	
	| groupNames |
	groupNames := self 
					at: self class groupId key
					ifAbsentPut: [ OrderedCollection new ].
	groupNames add: aString.
]

{ #category : #accessing }
BioA31StructureSection >> addGroups: aCollection [
	" Set the number of groups defined in the structure "
	
	aCollection do: [ : bioA31Group |
		self addGroup: bioA31Group name ]
]

{ #category : #accessing }
BioA31StructureSection >> addNbGroups: aNumber [
	" Set the number of groups defined in the structure "
	
	self 
		at: self class nbGroupsId key
		put: aNumber asString
]

{ #category : #accessing }
BioA31StructureSection >> addStructureName: aString [
	" Set aString structure name to the receiver "

	self 
		at: self class structureNameId key
		put: aString

]

{ #category : #writing }
BioA31StructureSection >> writeGroups: assoc on: aStream [
	aStream
		nextPut: ${;
		nextPut: Character cr.
	assoc value
		do: [ :grName | aStream nextPutAll: (grName ifNil: [ String empty ]) between: $" and: $" ]
		separatedBy: [ aStream nextPut: Character cr ].
	aStream nextPut: $}
]

{ #category : #writing }
BioA31StructureSection >> writeLabelOn: aStream [
	aStream
		nextPutAll: self class notation between: $[ and: $];
		nextPut: Character cr
]

{ #category : #private }
BioA31StructureSection >> writeOn: aStream [
	" Write the receiver's section on aStream "

	self writeLabelOn: aStream.
	self associationsDo: [ :assoc | 
		" Label key case "
		aStream tab;
			nextPutAll: assoc key;
			nextPut: $=.
		assoc value isString 
			ifTrue: [ self writeQuoted: assoc on: aStream ]					" Value case "
			ifFalse: [ self writeGroups: assoc on: aStream ]					" Groups case "
		]
]
