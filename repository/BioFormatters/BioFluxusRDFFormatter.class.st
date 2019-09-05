"
Fluxus Network New RDF Format Writer
"
Class {
	#name : #BioFluxusRDFFormatter,
	#superclass : #BioFileFormatter,
	#category : 'BioFormatters-Formatters'
}

{ #category : #accessing }
BioFluxusRDFFormatter class >> description [
	" Answer a <String> identifying the receiver's class "
	
	^ 'Fluxus Network New RDF Format Writer'
]

{ #category : #accessing }
BioFluxusRDFFormatter class >> formatExtension [
	" Private - Answer a String corresponding for the receiver's file output format "

	^ 'rdf'

]

{ #category : #accessing }
BioFluxusRDFFormatter class >> identifiers [
	" Answer a <Collection> of identifiers of the receiver "
	
	^ #('RDF' 'RDF Windows Format' 'RDF New Format' 'Fluxus Network RDF')
]

{ #category : #'instance creation' }
BioFluxusRDFFormatter class >> named: aString forGroups: aClassifier [

	| formatter |
	
	formatter := self new
				outputFilename: aString;
				samples: aClassifier alignments.
	^ formatter export
]

{ #category : #accessing }
BioFluxusRDFFormatter >> export [
	" Write the contents to receiver's file name "

	self exportHeader.
	self exportPositions.
	self exportWeights.
	self exportFromAlignment: self samples.
	self 
		dumpToFileNamedFullPath: self outputFilename
		contents: self stream contents.


	
]

{ #category : #accessing }
BioFluxusRDFFormatter >> exportFromAlignment: aBioAlignment [

	^ aBioAlignment do: [: seq |
			self stream 
				nextPut: $>;
				nextPutAll: seq name;
				space;
				nextPutAll: self frequencies;
				nextPutAll: seq asString;
				cr ]
]

{ #category : #accessing }
BioFluxusRDFFormatter >> exportHeader [

	self stream 
			nextPutAll: '  ;1.0';
			cr
]

{ #category : #accessing }
BioFluxusRDFFormatter >> exportPositions [

	1 to: self samples anyOne size do: [: index |
		 self stream 
				nextPutAll: index asString;
				space;
				nextPut: $; ].
	self stream cr
]

{ #category : #accessing }
BioFluxusRDFFormatter >> exportWeights [

	self samples anyOne size 
		timesRepeat: [
			 self stream 
				nextPutAll: '10';
				nextPut: $; ].
	self stream cr
]

{ #category : #accessing }
BioFluxusRDFFormatter >> fileNamePrefix [
	" Answer a <String> with the prefix of the output file name "
	
	^ 'BioST-Exported-fluxus-rdf_'
]

{ #category : #accessing }
BioFluxusRDFFormatter >> frequencies [

	^ self stream 
			nextPutAll: ';1;;;;;;;';
			cr
]
