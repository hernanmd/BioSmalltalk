"
A local wrapper wraps commands in a local environment (image).

Example

BioLocalWrapper ls.
BioLocalWrapper time.

"
Class {
	#name : #BioLocalWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Core'
}

{ #category : #'instance creation' }
BioLocalWrapper class >> ls [
	" List contents of current image directory "
	
	^ self new
		programName: 'dir';
		execute
		
]

{ #category : #'instance creation' }
BioLocalWrapper class >> time [
	" List contents of current image directory "
	
	^ (self new
		programName: 'time /T';
		execResult) withoutCRs
		
]
