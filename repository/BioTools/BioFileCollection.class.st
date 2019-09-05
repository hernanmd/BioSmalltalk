"
Abstract class grouping behavior for file collection objects. Behavior includes methods for manipulating groups of related files, for example, with the same format.


"
Class {
	#name : #BioFileCollection,
	#superclass : #BioOrderedCollection,
	#category : #'BioTools-Collections'
}

{ #category : #accessing }
BioFileCollection class >> fileClass [
	" Answer the class of the containee elements "	

	self subclassResponsibility 
]

{ #category : #'instance creation' }
BioFileCollection class >> filesFromDirectory: aDirectoryString [
	" Answer a Collection of files iterating recursively over the files located at aDirectoryString "

	^ ((BioObject filesIn: aDirectoryString)
			collect: [ : entry | 
				entry isDirectory
					ifFalse: [ self fileClass on: entry ]
					ifTrue: [ self filesFromDirectory: entry fullName ] ]) joinUsing: Array new.
]

{ #category : #printing }
BioFileCollection >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	self printNameOn: aStream.
	aStream 
		space;
		nextPutAll: self size asString 
		between: $( and: $)
]
