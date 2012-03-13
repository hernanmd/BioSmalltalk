accessing-qualifiers
qualifierDemonym
	" Answer a String - If the receiver subject demonym information if present then answer that demonym. If not answer an empty String. This method assumes the qualifiersDictionary has only one (correct = accurate) qualifier value. "

	| description |
	
	description := self subject 
		at: self idForDemonym
		ifAbsent: [ String empty ].
	"words := description subStrings difference: self stopWords."
	^ description isEmpty 
		ifTrue: [ description ]
		ifFalse: [ description extractCountryDemonym ]