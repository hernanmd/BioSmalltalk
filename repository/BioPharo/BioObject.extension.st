Extension { #name : #BioObject }

{ #category : #'*biopharo' }
BioObject class >> alert: aString [
	"Open an alert dialog."

	^ UITheme builder alert: aString
]

{ #category : #'*biopharo' }
BioObject >> connectionRetry [ 
	" Private - Ask for retrying attempt "
	
	^ UIManager default 
			chooseFrom: #('try again' 'give up') 
			title: 'Would you like to try again?' translated
]

{ #category : #'*biopharo' }
BioObject class >> requestCsvFile [
	" Open request dialog to select a CSV file "
	
	^ UIManager default 
		chooseFullFileNameMatching:  (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension)
		label: 'Choose CSV file'
]

{ #category : #'*biopharo' }
BioObject class >> requestFastaFile [
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'
]

{ #category : #'*biopharo' }
BioObject class >> requestXmlFile [
	" Open request dialog to select a XML file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension)
		label: 'Choose XML file'
]
