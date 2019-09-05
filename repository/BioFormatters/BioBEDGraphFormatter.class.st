"
Allows display of continuous-valued data in track format. This display type is useful for probability scores and 
transcriptome data. 

"
Class {
	#name : #BioBEDGraphFormatter,
	#superclass : #BioBEDFormatter,
	#category : 'BioFormatters-Formatters-BED'
}

{ #category : #accessing }
BioBEDGraphFormatter >> fileNamePrefix [
	" Answer a default prefix <String> for the output file name "
	
	^ super fileNamePrefix , 'Graph_'
]
