"
Wrapper for ShapeIt2 release 644. Extends BioShapeIt2Wrapper with version-specific configuration.
"
Class {
	#name : 'BioShapeIt2WrapperR644',
	#superclass : 'BioShapeIt2Wrapper',
	#category : 'BioWrappers-Popgen',
	#package : 'BioWrappers',
	#tag : 'Popgen'
}

{ #category : 'programs' }
BioShapeIt2WrapperR644 class >> shapeIt [
	" Answer a <String> with the command line name "

	^ 'shapeit.v2.r644.linux.x86_64'
]
