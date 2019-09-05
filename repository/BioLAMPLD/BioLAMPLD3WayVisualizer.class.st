"
LAMP-LD visualizer for 3 mixing populations.
"
Class {
	#name : #BioLAMPLD3WayVisualizer,
	#superclass : #BioLAMPLD2WayVisualizer,
	#instVars : [
		'population3Name',
		'population3Color'
	],
	#category : 'BioLAMPLD-Visualization'
}

{ #category : #private }
BioLAMPLD3WayVisualizer >> findAlleleRefCount [ 

	^ dataPoints collect: [ : a | 
			| alleleCode |
			alleleCode := a first.
			alleleCode = '22'
				ifTrue: [  ]
				ifFalse: [ 
					alleleCode = '12'
						ifTrue: [  ]
						ifFalse: [ 
							alleleCode = '02'
								ifTrue: [  ]
								ifFalse: [ self findAllele2Way: alleleCode ] ] ] ]

]

{ #category : #initialization }
BioLAMPLD3WayVisualizer >> initializeMatrix [

	matrix := DhbMatrix rows: 4 columns: self snpCount.
	matrix atAllPut: 0.
	1 to: self snpCount do: [ : colIndex | 
		dataPoints pairsDo: [ :hapArray1 :hapArray2 | 
			| h1 h2 |
			h1 := hapArray1 at: colIndex.
			h2 := hapArray2 at: colIndex.
			(h1 = $1 and: [ h2 = $1 ])
				ifTrue: [ matrix at: 1 at: colIndex put: (matrix at: 1 at: colIndex) + 1 ]
				ifFalse: [ 
					(h1 = $0 and: [ h2 = $1 ])
						ifTrue: [ matrix at: 2 at: colIndex put: (matrix at: 2 at: colIndex) + 1 ]
						ifFalse: [ 
							(h1 = $0 and: [ h2 = $0 ])
								ifTrue: [ matrix at: 3 at: colIndex put: (matrix at: 3 at: colIndex) + 1 ]
								ifFalse: [ 
									(h1 = $1 and: [ h2 = $0 ])
										ifTrue: [ matrix at: 4 at: colIndex put: (matrix at: 4 at: colIndex) + 1 ]
										ifFalse: [ 'do nothing' ] ] ] ] ] ].
]

{ #category : #accessing }
BioLAMPLD3WayVisualizer >> population3Color [
	^ population3Color
]

{ #category : #accessing }
BioLAMPLD3WayVisualizer >> population3Color: anObject [
	population3Color := anObject
]

{ #category : #accessing }
BioLAMPLD3WayVisualizer >> population3Name [
	^ population3Name
]

{ #category : #accessing }
BioLAMPLD3WayVisualizer >> population3Name: anObject [
	population3Name := anObject
]

{ #category : #accessing }
BioLAMPLD3WayVisualizer >> population3Name: aString color: aColor [

	population3Name := aString.
	population3Color := aColor.

]
