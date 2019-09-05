Extension { #name : #MorphicUIManager }

{ #category : #'*biopharo' }
MorphicUIManager >> explorer: anObjectExplorer for: anObject withLabel: label [ 

	anObjectExplorer rootObject: anObject.
	^ anObjectExplorer buildWindowFor: anObject label: label	

]
