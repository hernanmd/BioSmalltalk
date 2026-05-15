"
Implements the ISAG-FAO recommended panel of microsatellite (STR) markers for genetic diversity characterization of animal genetic resources. The panel provides standardized marker sets for 10 species: cattle, buffaloes, sheep, goats, pigs, horses, donkeys, camelids, chickens, and dogs. Marker data including allele ranges is sourced from Appendix 7 of the FAO guidelines publication ""Molecular Genetic Characterization of Animal Genetic Resources"" (FAO Animal Production and Health Guidelines No. 9).

Class-side methods provide:
- markerAlleleRangesFor<Species>: raw marker name and allele range data
- markersFor<Species>: BioLocus objects with start/end positions
- populatePanelFor<Species>: populate the instance table
- markersForSpecies: dictionary of all species to their marker data

Usage:

 BioISAGPanel markersForSpeciesAt: 'cattle'
 BioISAGPanel populatePanels
"
Class {
	#name : 'BioISAG_STRPanel',
	#superclass : 'BioPanel',
	#category : 'BioTools-Panels',
	#package : 'BioTools',
	#tag : 'Panels'
}

{ #category : 'accessing - buffaloes' }
BioISAG_STRPanel class >> markerAlleleRangesForBuffaloes [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended buffalo microsatellite markers (Appendix 7) "

	^ #(
		#('CSSM033' 154 175)
		#('CSSM038' 163 187)
		#('CSSM043' 222 258)
		#('CSSM047' 127 162)
		#('CSSM036' 162 176)
		#('CSSM019' 131 161)
		#('CSRM060' 95 135)
		#('CSSM029' 174 196)
		#('CSSM041' 129 147)
		#('CSSM057' 102 130)
		#('BRN' 121 147)
		#('CSSM032' 208 224)
		#('CSSM008' 179 193)
		#('CSSM045' 102 122)
		#('CSSM022' 203 213)
		#('CSSM046' 152 160)
		#('CSSM013' 162 172)
		#('ETH003' 96 192)
		#('CSSM061' 100 126)
		#('BMC1013' 217 239)
		#('DRB3' 142 198)
		#('CSSME070' 119 139)
		#('ETH121' 182 198)
		#('ILSTS033' 126 138)
		#('ILSTS005' 173 186)
		#('ILSTS030' 146 158)
		#('ILSTS008' 168 176)
		#('RM099' 87 119)
		#('HMH1R' 169 187)
		)
]

{ #category : 'accessing - camelid' }
BioISAG_STRPanel class >> markerAlleleRangesForCamelid [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended camelid microsatellite markers (Appendix 7). Allele ranges span alpaca llama Bactrian and dromedary camel species. "

	^ #(
		#('CMS9' 229 256)
		#('CMS13' 238 265)
		#('CMS15' 121 159)
		#('CMS17' 135 167)
		#('CMS18' 157 188)
		#('CMS25' 93 128)
		#('CMS32' 167 209)
		#('CMS50' 129 190)
		#('CMS121' 128 166)
		#('CVRL01' 188 253)
		#('CVRL02' 205 216)
		#('CVRL05' 148 176)
		#('CVRL06' 185 205)
		#('CVRL07' 255 306)
		#('LCA66' 212 262)
		#('VOLP03' 129 206)
		#('VOLP08' 142 180)
		#('VOLP10' 231 268)
		#('VOLP32' 192 262)
		#('VOLP67' 142 203)
		#('YWLL08' 133 177)
		#('YWLL09' 154 180)
		#('YWLL38' 174 192)
		#('YWLL44' 86 120)
		#('YWLL59' 96 136)
		)
]

{ #category : 'accessing - cattle' }
BioISAG_STRPanel class >> markerAlleleRangesForCattle [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended cattle microsatellite markers (Appendix 7) "

	^ #(
		#('INRA063' 167 189)
		#('INRA005' 135 149)
		#('ILSTS005' 176 194)
		#('HEL5' 145 171)
		#('HEL1' 99 119)
		#('INRA035' 100 124)
		#('ETH152' 181 211)
		#('ETH10' 207 231)
		#('HEL9' 141 173)
		#('CSSM66' 171 209)
		#('INRA032' 160 204)
		#('ETH3' 103 133)
		#('BM2113' 122 156)
		#('BM1824' 176 197)
		#('HEL13' 178 200)
		#('INRA037' 112 148)
		#('BM1818' 248 278)
		#('ILSTS006' 277 309)
		#('MM12' 101 145)
		#('CSRM60' 79 115)
		#('ETH185' 214 246)
		#('HAUT24' 104 158)
		#('HAUT27' 120 158)
		#('TGLA227' 75 105)
		#('TGLA126' 115 131)
		#('TGLA53' 143 191)
		#('SPS115' 234 258)
		#('ETH225' 131 159)
		#('TGLA122' 136 184)
		#('INRA023' 195 225)
		)
]

{ #category : 'accessing - chicken' }
BioISAG_STRPanel class >> markerAlleleRangesForChicken [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended chicken microsatellite markers (Appendix 7) "

	^ #(
		#('ADL0268' 102 116)
		#('MCW0206' 221 249)
		#('LEI0166' 354 370)
		#('MCW0295' 88 106)
		#('MCW0081' 112 135)
		#('MCW0014' 164 182)
		#('MCW0183' 296 326)
		#('ADL0278' 114 126)
		#('MCW0067' 176 186)
		#('MCW0104' 190 234)
		#('MCW0123' 76 100)
		#('MCW0330' 256 300)
		#('MCW0165' 114 118)
		#('MCW0069' 158 176)
		#('MCW0248' 205 225)
		#('MCW0111' 96 120)
		#('MCW0020' 179 185)
		#('MCW0034' 212 246)
		#('LEI0234' 216 364)
		#('MCW0103' 266 270)
		#('MCW0222' 220 226)
		#('MCW0016' 162 206)
		#('MCW0037' 154 160)
		#('MCW0098' 261 265)
		#('LEI0094' 247 287)
		#('MCW0284' 235 243)
		#('MCW0078' 135 147)
		#('LEI0192' 244 370)
		#('ADL0112' 120 134)
		#('MCW0216' 139 149)
		)
]

{ #category : 'accessing - dog' }
BioISAG_STRPanel class >> markerAlleleRangesForDog [

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

{ #category : 'accessing - donkey' }
BioISAG_STRPanel class >> markerAlleleRangesForDonkey [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended donkey microsatellite markers (Appendix 7) "

	^ #(
		#('HMS07' 165 183)
		#('ASB17' 91 109)
		#('ASB23' 128 154)
		#('HMS06' 153 169)
		#('LEX34' 245 255)
		#('HTG07' 272 297)
		#('SGCV28' 151 163)
		#('AHT05' 130 146)
		#('HMS03' 150 170)
		#('HMS02' 218 238)
		#('LEX68' 162 174)
		#('COR058' 210 230)
		#('COR069' 273 279)
		#('VHL209' 84 96)
		#('ASB02' 222 254)
		#('AHT04' 148 164)
		#('COR018' 249 271)
		#('COR071' 190 202)
		#('LEX54' 165 177)
		#('HTG06' 84 106)
		#('HTG10' 93 113)
		#('COR022' 254 264)
		#('LEX63' 241 249)
		#('LEX33' 203 217)
		#('HMS20' 116 140)
		#('COR007' 156 170)
		#('LEX73' 234 264)
		#('HMS45' 185 197)
		#('NVHEQ054' 172 186)
		#('COR082' 192 226)
		)
]

{ #category : 'accessing - goat' }
BioISAG_STRPanel class >> markerAlleleRangesForGoat [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended goat microsatellite markers (Appendix 7) "

	^ #(
		#('SRCRSP5' 156 178)
		#('MAF065' 116 158)
		#('MAF70' 134 168)
		#('SRCRSP23' 81 119)
		#('OarFCB48' 149 173)
		#('INRA023' 196 215)
		#('SRCRSP9' 99 135)
		#('OarAE54' 115 138)
		#('SRCRSP8' 215 255)
		#('SPS113' 134 158)
		#('INRABERN172' 234 256)
		#('OarFCB20' 93 112)
		#('CSRD247' 220 247)
		#('MCM527' 165 187)
		#('ILSTS087' 135 155)
		#('INRA063' 164 186)
		#('ILSTS011' 250 300)
		#('ILSTS005' 172 218)
		#('SRCRSP15' 172 198)
		#('SRCRSP3' 98 122)
		#('ILSTS029' 148 170)
		#('TGLA53' 126 160)
		#('ETH10' 200 210)
		#('MAF209' 100 104)
		#('INRABERN185' 261 289)
		#('P19DYA' 160 196)
		#('TCRVB6' 217 255)
		#('SRCRSP7' 117 131)
		#('BM6444' 118 200)
		#('DRBP1' 195 229)
		)
]

{ #category : 'accessing - horse' }
BioISAG_STRPanel class >> markerAlleleRangesForHorse [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended horse microsatellite markers (Appendix 7) "

	^ #(
		#('HMS07' 165 183)
		#('HMS06' 153 169)
		#('AHT05' 130 146)
		#('HTG04' 127 141)
		#('AHT04' 148 164)
		#('VHL20' 86 106)
		#('ASB17' 91 109)
		#('ASB23' 128 154)
		#('ASB02' 222 254)
		#('HMS03' 150 170)
		#('HTG10' 93 113)
		#('LEX33' 203 217)
		#('LEX34' 245 255)
		#('SGCV28' 151 163)
		#('COR058' 210 230)
		#('COR069' 273 279)
		#('VHL209' 84 96)
		#('COR007' 156 170)
		#('LEX54' 165 177)
		#('LEX73' 234 264)
		#('COR022' 254 264)
		#('COR018' 249 271)
		#('COR071' 190 202)
		#('HMS45' 185 197)
		#('COR082' 192 226)
		#('HMS02' 218 238)
		#('HTG06' 84 106)
		#('UCDEQ425' 237 247)
		#('HTG07' 120 130)
		)
]

{ #category : 'accessing - pig' }
BioISAG_STRPanel class >> markerAlleleRangesForPig [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended pig microsatellite markers (Appendix 7) "

	^ #(
		#('S0026' 156 178)
		#('S0155' 116 158)
		#('S0005' 134 168)
		#('Sw2410' 81 119)
		#('Sw830' 149 173)
		#('S0355' 196 215)
		#('Sw24' 99 135)
		#('Sw632' 115 138)
		#('Swr1941' 215 255)
		#('Sw936' 134 158)
		#('S0218' 234 256)
		#('S0228' 93 112)
		#('Sw122' 220 247)
		#('Sw857' 165 187)
		#('S0097' 135 155)
		#('Sw240' 164 186)
		#('IGF1' 256 294)
		#('Sw2406' 117 131)
		#('Sw72' 172 218)
		#('S0226' 172 198)
		#('S0090' 227 253)
		#('Sw2008' 148 170)
		#('Sw1067' 126 160)
		#('S0101' 200 210)
		#('Sw1828' 100 104)
		#('S0143' 261 289)
		#('S0068' 118 200)
		#('S0178' 160 196)
		#('Sw911' 217 255)
		#('S0002' 195 229)
		)
]

{ #category : 'accessing - sheep' }
BioISAG_STRPanel class >> markerAlleleRangesForSheep [

	" Answer a <Collection> of allele range tuples for ISAG-FAO recommended sheep microsatellite markers (Appendix 7) "

	^ #(
		#('OarFCB128' 96 130)
		#('OarCP34' 112 130)
		#('OarCP38' 117 129)
		#('OarHH47' 130 152)
		#('OarVH72' 121 145)
		#('OarAE129' 133 159)
		#('BM1329' 160 182)
		#('BM8125' 110 130)
		#('HUJ616' 114 160)
		#('DYMS1' 159 211)
		#('SRCRSP9' 99 135)
		#('OarCB226' 119 153)
		#('ILSTS5' 174 218)
		#('ILSTS11' 256 294)
		#('ILSTS28' 105 177)
		#('SRCRSP5' 126 158)
		#('MAF214' 174 282)
		#('SRCRSP1' 116 148)
		#('MAF33' 121 141)
		#('MCM140' 167 193)
		#('OarFCB20' 95 120)
		#('OarFCB193' 96 136)
		#('OarFCB304' 150 188)
		#('OarJMP29' 96 150)
		#('OarJMP58' 145 169)
		#('MAF65' 123 127)
		#('MAF70' 124 166)
		#('BM1824' 176 197)
		#('INRA063' 167 189)
		)
]

{ #category : 'accessing - buffaloes' }
BioISAG_STRPanel class >> markersForBuffaloes [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'buffaloes') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - camelid' }
BioISAG_STRPanel class >> markersForCamelid [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'camelid') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - cattle' }
BioISAG_STRPanel class >> markersForCattle [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'cattle') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - chicken' }
BioISAG_STRPanel class >> markersForChicken [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'chicken') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - dog' }
BioISAG_STRPanel class >> markersForDog [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'dog') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - donkey' }
BioISAG_STRPanel class >> markersForDonkey [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'donkey') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - goat' }
BioISAG_STRPanel class >> markersForGoat [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'goat') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - horse' }
BioISAG_STRPanel class >> markersForHorse [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ (self markersForSpecies: 'horse') 
		collect: [ : markerInfo | 
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - pig' }
BioISAG_STRPanel class >> markersForPig [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'pig') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing - sheep' }
BioISAG_STRPanel class >> markersForSheep [
	" Answer a <Collection> of <BioMicrosatelliteLocus> for the receiver's panel "

	^ (self markersForSpecies: 'sheep') 
		collect: [ : markerInfo | 			
			(BioLocus newNamed: markerInfo first)
				start: markerInfo second;
				end: markerInfo third;
				yourself ]
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> markersForSpecies [
	" Answer a <Dictionary> mapping species names to their ISAG-FAO recommended microsatellite marker allele ranges (Appendix 7) "

	^ Dictionary new
		at: 'cattle' put: self markerAlleleRangesForCattle;
		at: 'dog' put: self markerAlleleRangesForDog;
		at: 'sheep' put: self markerAlleleRangesForSheep;
		at: 'goat' put: self markerAlleleRangesForGoat;
		at: 'pig' put: self markerAlleleRangesForPig;
		at: 'buffaloes' put: self markerAlleleRangesForBuffaloes;
		at: 'horse' put: self markerAlleleRangesForHorse;
		at: 'donkey' put: self markerAlleleRangesForDonkey;
		at: 'camelid' put: self markerAlleleRangesForCamelid;
		at: 'chicken' put: self markerAlleleRangesForChicken;
		yourself
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> markersForSpecies: aString [
	" Answer a <Collection> of <BioLocus> for the receiver's panel "

	^ self markersForSpecies at: aString
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> panelName [
	" Private - See superimplementor's comment "
	
	^ 'ISAG'
]

{ #category : 'accessing - buffaloes' }
BioISAG_STRPanel class >> populatePanelForBuffaloes [

	self table 
		at: 'buffaloes'
		put: self markersForBuffaloes
]

{ #category : 'accessing - camelid' }
BioISAG_STRPanel class >> populatePanelForCamelid [

	self table 
		at: 'camelid'
		put: self markersForCamelid
]

{ #category : 'accessing - cattle' }
BioISAG_STRPanel class >> populatePanelForCattle [

	self table 
		at: 'cattle'
		put: self markersForCattle
]

{ #category : 'accessing - chicken' }
BioISAG_STRPanel class >> populatePanelForChicken [

	self table 
		at: 'chicken'
		put: self markersForChicken
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> populatePanelForDog [

	self table 
		at: 'dog'
		put: self markersForDog
]

{ #category : 'accessing - donkey' }
BioISAG_STRPanel class >> populatePanelForDonkey [

	self table 
		at: 'donkey'
		put: self markersForDonkey
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> populatePanelForGoats [

	self table 
		at: 'goat'
		put: self markersForGoat
]

{ #category : 'accessing - horse' }
BioISAG_STRPanel class >> populatePanelForHorse [

	self table 
		at: 'horse'
		put: self markersForHorse
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> populatePanelForPigs [

	self table 
		at: 'pig'
		put: self markersForPig
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> populatePanelForSheep [

	self table 
		at: 'sheep'
		put: self markersForSheep
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> populatePanels [

	self 
		populatePanelForCattle;
		populatePanelForDog;
		populatePanelForSheep;
		populatePanelForGoats;
		populatePanelForPigs;
		populatePanelForBuffaloes;
		populatePanelForHorse;
		populatePanelForDonkey;
		populatePanelForCamelid;
		populatePanelForChicken;
		yourself
]

{ #category : 'accessing' }
BioISAG_STRPanel class >> supportedMarkerTypes [
	" Answer a <Collection> of supported types of markers "
	
	^ Array with: #BioSTRSequence
]
