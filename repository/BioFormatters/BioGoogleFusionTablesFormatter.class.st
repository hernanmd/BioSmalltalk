"
The Google Fusion Tables format is described here: http://www.google.com/drive/start/apps.html#fusiontables
"
Class {
	#name : #BioGoogleFusionTablesFormatter,
	#superclass : #BioCSVFormatter,
	#category : 'BioFormatters-Formatters-CSV'
}

{ #category : #accessing }
BioGoogleFusionTablesFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'Google Fusion Tables Writer'
]

{ #category : #accessing }
BioGoogleFusionTablesFormatter class >> identifiers [
	" See superimplementor's comment "
	
	^ #('Google Fusion Tables')
]

{ #category : #accessing }
BioGoogleFusionTablesFormatter >> exportFrom: aBioClassifier [

	^ super exportFrom: aBioClassifier organizationContents

	
]

{ #category : #accessing }
BioGoogleFusionTablesFormatter >> exportFrom: aCollection features: featuresCollection [ 

	self initializeStream: aCollection.
	aCollection associationsDo: [ : assoc |
		stream 
			nextPutAll: assoc key;
			nextPut: self delimiterSourceCharacter;
			nextPutAll: assoc value size asString;
			bioCr ].
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: stream contents
]
