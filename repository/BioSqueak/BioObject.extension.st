Extension { #name : #BioObject }

{ #category : #'*BioSqueak' }
BioObject class >> fileReferenceClass [
	" Private - This is platform specific "

	^ FSReference	
]

{ #category : #'*BioSqueak' }
BioObject >> fileReferenceClass [
	" Private - This is platform specific "

	^ self class fileReferenceClass	
]

{ #category : #'*BioSqueak' }
BioObject >> fileSystemClass [
	" Private - This is platform specific "
	
	^ self class fileSystemClass
]

{ #category : #'*BioSqueak' }
BioObject class >> fileSystemClass [
	" Private - This is platform specific "
	
	^ FSFilesystem
]

{ #category : #'*BioSqueak' }
BioObject class >> requestCsvFile [
	" Convenience method for selecting a CSV file "
	
	^ UIManager default 
			chooseFileMatching: (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension) 
			label: 'Please select a CSV file' translated
]

{ #category : #'*BioSqueak' }
BioObject class >> requestFastaFile [
	" Convenience method for selecting a fasta file "
	
	^ UIManager default 
			chooseFileMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension) 
			label: 'Please select a fasta file' translated
]

{ #category : #'*BioSqueak' }
BioObject class >> requestXmlFile [
	" Convenience method for selecting a XML file "
	
	^ UIManager default 
			chooseFileMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension) 
			label: 'Please select a XML file' translated
]
