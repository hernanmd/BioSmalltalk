Extension { #name : #FSReference }

{ #category : #'*BioSqueak' }
FSReference classSide >> fileSystem: aFilesystem path: aPath [
	^ self new setFilesystem: aFilesystem path: aPath
]
