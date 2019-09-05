Extension { #name : #Object }

{ #category : #'*BioPharo4' }
Object >> alert: aString [
	" See class comment "

	^ self class alert: aString
]

{ #category : #'*BioPharo4' }
Object class >> alert: aString [
	"Open an alert dialog."

	^ UITheme builder alert: aString
]

{ #category : #'*BioPharo4' }
Object >> openFullFileNamed: fileName [
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ BioObject openFullFileNamed: fileName
]

{ #category : #'*BioPharo4' }
Object >> requestOpenCSVFile [
	" See comment in BioObject "

	^ BioObject requestOpenCSVFile
]

{ #category : #'*BioPharo4' }
Object >> requestOpenCSVFile: aBlock [
	" See comment in BioObject "

	^ BioObject requestOpenCSVFile: aBlock
]
