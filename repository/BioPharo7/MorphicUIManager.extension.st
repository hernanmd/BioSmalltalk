Extension { #name : #MorphicUIManager }

{ #category : #'*BioPharo7' }
MorphicUIManager >> explorer: anObjectExplorer for: anObject withLabel: label [ 

	anObjectExplorer rootObject: anObject.
	^ anObjectExplorer buildWindowFor: anObject label: label	

]
