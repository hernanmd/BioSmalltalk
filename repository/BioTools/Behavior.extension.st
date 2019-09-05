Extension { #name : #Behavior }

{ #category : #'*BioTools' }
Behavior >> allSuperclassesExcluding: aClass [
	"Answer an OrderedCollection of the receiver's and the receiver's  
	ancestor's superclasses up to aClass NOT included. The first element is the receiver's immediate  
	superclass up to aClass included."

	| classes |
	classes := self allSuperclassesIncluding: aClass.
	classes removeLast.
	^ classes
]
