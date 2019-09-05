Extension { #name : #FSFilesystem }

{ #category : #'*BioSqueak' }
FSFilesystem classSide >> disk [
	"Answer a filesystem that represents the 'on-disk' filesystem used by the host operating system."

	^ FSDiskStore currentFilesystem
]
