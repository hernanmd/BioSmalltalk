Class {
	#name : 'BioPDBAtomRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'serialNumber',
		'atomName',
		'altLoc',
		'resName',
		'chainID',
		'resSeq',
		'iCode',
		'x',
		'y',
		'z',
		'occupancy',
		'tempFactor',
		'element',
		'charge'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBAtomRecord >> altLoc [
	^ altLoc
]

{ #category : 'accessing' }
BioPDBAtomRecord >> altLoc: aString [
	altLoc := aString
]

{ #category : 'accessing' }
BioPDBAtomRecord >> atomName [
	^ atomName
]

{ #category : 'accessing' }
BioPDBAtomRecord >> atomName: aString [
	atomName := aString
]

{ #category : 'accessing' }
BioPDBAtomRecord >> chainID [
	^ chainID
]

{ #category : 'accessing' }
BioPDBAtomRecord >> chainID: aString [
	chainID := aString
]

{ #category : 'accessing' }
BioPDBAtomRecord >> charge [
	^ charge
]

{ #category : 'accessing' }
BioPDBAtomRecord >> charge: aString [
	charge := aString
]

{ #category : 'accessing' }
BioPDBAtomRecord >> element [
	^ element
]

{ #category : 'accessing' }
BioPDBAtomRecord >> element: aString [
		element := aString
]

{ #category : 'accessing' }
BioPDBAtomRecord >> iCode [
	^ iCode
]

{ #category : 'accessing' }
BioPDBAtomRecord >> iCode: aString [
	iCode := aString
]

{ #category : 'testing' }
BioPDBAtomRecord >> isAtomRecord [
	^ true
]

{ #category : 'accessing' }
BioPDBAtomRecord >> occupancy [
	^ occupancy
]

{ #category : 'accessing' }
BioPDBAtomRecord >> occupancy: aNumber [
	occupancy := aNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> resName [
	^ resName
]

{ #category : 'accessing' }
BioPDBAtomRecord >> resName: aString [
	resName := aString
]

{ #category : 'accessing' }
BioPDBAtomRecord >> resSeq [
	^ resSeq
]

{ #category : 'accessing' }
BioPDBAtomRecord >> resSeq: aNumber [
	resSeq := aNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> serialNumber [
	^ serialNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> serialNumber: aNumber [
	serialNumber := aNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> tempFactor [
	^ tempFactor
]

{ #category : 'accessing' }
BioPDBAtomRecord >> tempFactor: aNumber [
	tempFactor := aNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> x [
	^ x
]

{ #category : 'accessing' }
BioPDBAtomRecord >> x: aNumber [
	x := aNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> y [
	^ y
]

{ #category : 'accessing' }
BioPDBAtomRecord >> y: aNumber [
	y := aNumber
]

{ #category : 'accessing' }
BioPDBAtomRecord >> z [
	^ z
]

{ #category : 'accessing' }
BioPDBAtomRecord >> z: aNumber [
	z := aNumber
]
