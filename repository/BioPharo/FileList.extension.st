Extension { #name : #FileList }

{ #category : #'*biopharo' }
FileList >> bioMaterialize [ 
	" Private - Materialize and open an explorer over the receiver's selected file "
	
	(BioSerializationEngine materialize: self fullName) explore
]

{ #category : #'*biopharo' }
FileList >> itemsForAnyFile [
	"Answer a list of universal services that could apply to any file"
	
	| services |
	services := OrderedCollection new: 4.
	services add: self serviceCopyName. 
	services add: self serviceRenameFile. 
	services add: self serviceDeleteFile.
	services add: self serviceViewContentsInWorkspace.
	services add: self serviceBioMaterialize.
	^ services
]

{ #category : #'*biopharo' }
FileList >> serviceBioMaterialize [

	^ ( SimpleServiceEntry 
		provider: self 
		label: 'BioSmalltalk: Materialize' 
		selector: #bioMaterialize 
		description: 'Materialize and Explore this file' )
]
