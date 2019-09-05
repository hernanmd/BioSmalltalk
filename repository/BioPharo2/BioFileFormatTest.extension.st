Extension { #name : #BioFileFormatTest }

{ #category : #'*biopharo2' }
BioFileFormatTest >> csvContents01 [
	" Answer a <String> with a sample test file path "
	
	^ BioObject testFilesFullDirectoryName / 'Test001.csv'
]

{ #category : #'*biopharo2' }
BioFileFormatTest >> phylipContents01 [
	" Answer a <String> with a sample test file path "
	
	^ BioObject testFilesFullDirectoryName / 'dna_interleaved.phy'
]

{ #category : #'*biopharo2' }
BioFileFormatTest >> phylipContents02 [
	" Answer a <String> with a sample test file path "
	
	^ BioObject testFilesFullDirectoryName / 'dna_sequential.phy'
]
