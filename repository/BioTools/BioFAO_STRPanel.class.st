"
Represents a panel of loci recommended by the Food and Agriculture Organization of the United Nations (FAO) for genetic studies of domestic animals.

"
Class {
	#name : 'BioFAO_STRPanel',
	#superclass : 'BioPanel',
	#category : 'BioTools-Panels',
	#package : 'BioTools',
	#tag : 'Panels'
}

{ #category : 'accessing - cattle' }
BioFAO_STRPanel class >> markerAlleleRangesForCattle [

	^ #(
		#('SPS113' 254 276)
		#('RM067' 176 188)
		#('CSRM60' 92 116)
		#('CSSM66' 178 202)
		#('MGTG4B' 101 127)
		#('ILSTS006' 280 296)
		)
]

{ #category : 'accessing' }
BioFAO_STRPanel class >> markersForSpecies [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ Dictionary new
		at: 'cattle' 	put: self markerAlleleRangesForCattle;
		yourself
]

{ #category : 'accessing' }
BioFAO_STRPanel class >> panelName [
	" Private - See superimplementor's comment "
	
	^ 'FAO'
]

{ #category : 'accessing' }
BioFAO_STRPanel class >> supportedMarkerTypes [
	" Answer a <Collection> of supported types of markers "
	
	^ Array with: #BioSTRSequence
]
