"
I am a wrapper for Infernal/cmscan, a tool for searching RNA sequence alignments against covariance model (CM) databases.

Infernal is used for RNA homology search and is the core tool behind Rfam.

Usage:
| wrapper |
wrapper := BioInfernalWrapper new.
wrapper database: Rfam.cm.
wrapper input: rna_sequence.fasta.
wrapper evalue: 0.01.
wrapper cutGa.
wrapper execute.
"
Class {
	#name : 'BioInfernalWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-RNA',
	#package : 'BioWrappers',
	#tag : 'RNA'
}

{ #category : 'organization' }
BioInfernalWrapper class >> category [

	^ 'RNA Analysis'
]

{ #category : 'parameters' }
BioInfernalWrapper >> accel: aBool [

	aBool
		ifTrue: [ self addOption: 'acc' ]
		ifFalse: [ self addOption: 'noacc' ]
]

{ #category : 'parameters' }
BioInfernalWrapper >> cpu: aNumber [

	^ self propertyAt: 'cpu' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioInfernalWrapper >> cutCv [

	^ self addOption: 'cut_cv'
]

{ #category : 'parameters' }
BioInfernalWrapper >> cutGa [

	^ self addOption: 'cut_ga'
]

{ #category : 'parameters' }
BioInfernalWrapper >> cutNc [

	^ self addOption: 'cut_nc'
]

{ #category : 'parameters' }
BioInfernalWrapper >> database: aDbPath [

	^ self propertyAt: 'db' ifAbsentPut: [ self buildPath: aDbPath ]
]

{ #category : 'defaults' }
BioInfernalWrapper >> defaultProgramName [

	^ self execNameFor: 'cmscan'
]

{ #category : 'parameters' }
BioInfernalWrapper >> evalue: aNumber [

	^ self propertyAt: 'E' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioInfernalWrapper >> input: aFilename [

	^ self propertyAt: 'query' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioInfernalWrapper >> noali [

	^ self addOption: 'noali'
]

{ #category : 'parameters' }
BioInfernalWrapper >> outfile: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioInfernalWrapper >> tblout: aFilename [

	^ self
		  propertyAt: 'tblout'
		  ifAbsentPut: [ self buildPath: aFilename ]
]
