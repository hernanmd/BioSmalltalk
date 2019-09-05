"
Panel of 12 STR loci recommended by the International Society for Animal Genetics (ISAG) for routine use in bovine parentage testing and identification.

Examples

BioISAGPanel markersForCattle.

BioISAGPanel  markersForCattle.
"
Class {
	#name : #BioISAGPanel,
	#superclass : #BioPanel,
	#category : #'BioTools-Repeats'
}

{ #category : #'accessing - cattle' }
BioISAGPanel class >> markerAlleleRangesForCattle [

	^ #(
		#('BM1818' 254 276)
		#('BM1824' 176 188)
		#('BM2113' 125 145)
		#('ETH3' 101 127)
		#('ETH10' 207 221)
		#('ETH225' 140 156)
		#('INRA023' 202 224)
		#('SPS115' 248 260)
		#('TGLA53' 152 186)
		#('TGLA122' 137 181)
		#('TGLA126' 112 126)
		#('TGLA227' 77 103)
		
		#('HAUT27' 138 154) " Panel ???"
		)
]

{ #category : #'accessing - dog' }
BioISAGPanel class >> markerAlleleRangesForDog [

	^ #(
		"Multiplex 1"	
		#('AHT121' 0 0)
		#('AHT171' 0 0)
		#('AHT253' 0 0)
		#('C22.279' 0 0)
		#('FH2001' 0 0)
		#('FH2054' 0 0)
		#('FH2164' 0 0)
		#('FH2611' 0 0)
		#('FH2247' 0 0)
		#('FH2289' 0 0)
		#('INRA21' 0 0)
		#('PEZO8' 0 0)

		"Multiplex 2"
		#('AHTk211' 0 0)
		#('LEI2D2' 0 0)
		#('FH2326' 0 0)
		#('FH2328' 0 0)
		#('FH2361' 0 0)
		#('PEZ12' 0 0)
		#('PEZ22' 0 0)
		#('FH2305' 0 0)
		#('PEZ03' 0 0)
		#('PEZ10' 0 0)
		#('PEZ11' 0 0)
		)
		

]

{ #category : #'accessing - goat' }
BioISAGPanel class >> markerAlleleRangesForGoat [

	^ #(
		"Multiplex 1"
		#('INRA005' 0 0)
		#('INRA063' 0 0)
		#('MAF65' 0 0)
		#('SRCRSP5' 0 0)
		#('SRCRSP8' 0 0)
		#('SRCRSP24' 0 0)
		"Multiplex 2"
		#('CSRD247' 0 0)
		#('FCB20' 0 0)
		#('ILSTS87' 0 0)
		#('INRA023' 0 0)
		#('McM527' 0 0)
		#('SRCRSP23' 0 0)
		"Multiplex 3"
		#('BM1258' 0 0)
		#('BM1329' 0 0)
		#('BM1818' 0 0)
		#('INRA231' 0 0)
		)
]

{ #category : #'accessing - pig' }
BioISAGPanel class >> markerAlleleRangesForPig [

	^ #(
		"Multiplex 1"
		#('S0005' 0 0)
		#('S0090' 0 0)
		#('S0101' 0 0)
		#('S0155' 0 0)
		#('S0355' 0 0)
		#('S0386' 0 0)
		#('SW24' 0 0)
		#('SW240' 0 0)
		#('SW857' 0 0)
		#('SW951' 0 0)
		"Multiplex 2"
		#('SW72' 0 0)
		#('SW936' 0 0)
		#('SW911' 0 0)
		#('S0228' 0 0)
		#('S0227' 0 0)
		)
]

{ #category : #'accessing - sheep' }
BioISAGPanel class >> markerAlleleRangesForSheep [
		
	^ #(
		"Multiplex 1"	
		#('CSRD247' 254 276)
		#('HSC' 176 188)
		#('INRA063' 125 145)
		#('MAF214' 92 116)
		#('OarAE129' 178 202)
		#('OarCP49' 101 127)
		#('FCB11' 207 221)
		#('FCB304' 140 156)
		"Multiplex 2" 		
		#('D5S2' 138 154)
		#('INRA005' 280 296)
		#('INRA023' 202 224)
		#('MAF65' 248 260)
		#('McM527' 152 186)
		#('SPS113' 137 181)
		"Multiplex 3" 
		#('BM1258' 112 126)
		#('BM1329' 77 103)
		#('BM1818' 112 126)
		#('INRA231' 77 103)		
		)
]

{ #category : #'accessing - cattle' }
BioISAGPanel class >> markersForCattle [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'cattle') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : #'accessing - dog' }
BioISAGPanel class >> markersForDog [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'dog') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : #'accessing - goat' }
BioISAGPanel class >> markersForGoat [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'goat') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : #'accessing - pig' }
BioISAGPanel class >> markersForPig [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'pig') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : #'accessing - sheep' }
BioISAGPanel class >> markersForSheep [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'sheep') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : #accessing }
BioISAGPanel class >> markersForSpecies [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ Dictionary new
		at: 'cattle' 	put: self markerAlleleRangesForCattle;
		at: 'dog' 		put: self markerAlleleRangesForDog;
		at: 'sheep' 	put: self markerAlleleRangesForSheep;
		at: 'goat' 		put: self markerAlleleRangesForGoat;
		at: 'pig' 		put: self markerAlleleRangesForPig;
		yourself
]

{ #category : #accessing }
BioISAGPanel class >> markersForSpecies: aString [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ self markersForSpecies at: aString
]

{ #category : #accessing }
BioISAGPanel class >> panelName [
	" Private - See superimplementor's comment "
	
	^ 'ISAG'
]

{ #category : #'accessing - cattle' }
BioISAGPanel class >> populatePanelForCattle [

	self table 
		at: 'cattle'
		put: self markersForCattle
]

{ #category : #accessing }
BioISAGPanel class >> populatePanelForDog [

	self table 
		at: 'dog'
		put: self markersForDog
]

{ #category : #accessing }
BioISAGPanel class >> populatePanelForGoats [

	self table 
		at: 'goats'
		put: self markersForGoats
]

{ #category : #accessing }
BioISAGPanel class >> populatePanelForPigs [

	self table 
		at: 'pigs'
		put: self markersForPigs
]

{ #category : #accessing }
BioISAGPanel class >> populatePanelForSheep [

	self table 
		at: 'sheep'
		put: self markersForSheep
]

{ #category : #accessing }
BioISAGPanel class >> populatePanels [

	self 
		populatePanelForCattle;
		populatePanelForDog;
		yourself
]

{ #category : #accessing }
BioISAGPanel class >> supportedMarkerTypes [
	" Answer a <Collection> of supported types of markers "
	
	^ Array with: #BioSTRSequence
]
