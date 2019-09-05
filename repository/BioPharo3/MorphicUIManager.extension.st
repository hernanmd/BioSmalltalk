Extension { #name : #MorphicUIManager }

{ #category : #'*BioPharo3' }
MorphicUIManager >> explorer: anObjectExplorer for: anObject withLabel: label [ 

	anObjectExplorer rootObject: anObject.
	^ anObjectExplorer buildWindowFor: anObject label: label	

]
