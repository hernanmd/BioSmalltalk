"
Extension of the BED format which enhances track details supporting links and longer descriptions.

"
Class {
	#name : #BioBEDDetailFormatter,
	#superclass : #BioBEDFormatter,
	#category : 'BioFormatters-Formatters-BED'
}

{ #category : #accessing }
BioBEDDetailFormatter >> fileNamePrefix [
	" Answer a default prefix <String> for the output file name "
	
	^ super fileNamePrefix , 'Detail_'
]
