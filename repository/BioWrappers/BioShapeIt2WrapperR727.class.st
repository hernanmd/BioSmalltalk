"
Wrapper for ShapeIt2 release 727. Extends BioShapeIt2Wrapper with version-specific configuration.
"
Class {
	#name : 'BioShapeIt2WrapperR727',
	#superclass : 'BioShapeIt2Wrapper',
	#category : 'BioWrappers-Popgen',
	#package : 'BioWrappers',
	#tag : 'Popgen'
}

{ #category : 'programs' }
BioShapeIt2WrapperR727 class >> shapeIt [
	" Answer a <String> with the command line name "

	^ 'shapeit.v2.r727.linux.x64'
]
