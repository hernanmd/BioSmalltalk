Extension { #name : #BioNCBIGenBankReaderTest }

{ #category : #'*biopharo2' }
BioNCBIGenBankReaderTest class >> testFilesDirectoryName [
	" Answer a String where the files for testing will be placed "
	
	^ (BioObject testFilesFullDirectoryName / 'GenBankTestFiles') fullName
]
