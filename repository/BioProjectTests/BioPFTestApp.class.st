"
Dummy test application to support ProjectFramework with BioSmalltalk

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #BioPFTestApp,
	#superclass : #PFProjectApplication,
	#category : 'BioProjectTests-Core'
}

{ #category : #accessing }
BioPFTestApp >> defaultProjectClass [
	" Private - See superimplementor's comment "

	^ BioProject
]
