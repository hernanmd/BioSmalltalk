accessing
reverseTranslate: aString
	" Answer a codon String by aString amino acid "

	| translations |
	
	translations := OrderedCollection new.	
	self currentCodonTable keysAndValuesDo: [ :k :v |
			v = aString asUppercase
				ifTrue: [ translations addLast: k ] ].
	translations
		ifEmpty: [ self signalNotFound: aString asString , ' amino acid codon not found' ].
	^ translations