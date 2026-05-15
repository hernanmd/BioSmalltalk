Class {
	#name : 'BioVariantRegistered',
	#superclass : 'Announcement',
	#instVars : [
		'variant'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioVariantRegistered class >> variant: aVariant [

	^ self new
		  variant: aVariant;
		  yourself
]

{ #category : 'accessing' }
BioVariantRegistered >> variant [

	^ variant
]

{ #category : 'accessing' }
BioVariantRegistered >> variant: aVariant [

	variant := aVariant
]
