"
Parser for several FASTA file format elements. This class is not intended to be used directly. See BioParser for details parsing FASTA files.
"
Class {
	#name : #BioFASTAParser,
	#superclass : #BioAbstractTextParser,
	#category : #'BioParsers-Core'
}

{ #category : #'accessing-parsers' }
BioFASTAParser >> parserForAnyDescriptionLine [

	| separator token |

	separator := $| asPParser ==> [ : n | nil ].
	token := separator negate plus flatten.
	^ (token separatedBy: separator) ==> [ :nodes | ( nodes copyWithout: nil ) collect: #trimBoth ].
		
]

{ #category : #'accessing-parsers' }
BioFASTAParser >> parserForAnyDescriptionText [

	^ self parserForAnyDescriptionLine

]

{ #category : #'accessing-parsers' }
BioFASTAParser >> parserForDescriptionLine [

	^ ($> asPParser , self parserForAnyDescriptionLine , #newline asPParser) end
		

]

{ #category : #'accessing-parsers' }
BioFASTAParser >> parserForIdentifier [
	" Answer a parser for parsing an identifier in a FASTA entry "

	" Get rid of the last | character "
	^ self identifier asPParser ==> [: r | (r last = $|) ifTrue: [ r allButLast ] ifFalse: [ r ] ]
]

{ #category : #'accessing-parsers' }
BioFASTAParser >> parserForNonFastaString [
	" Answer a parser for parsing any kind of description text in a FASTA sequence "

	^ self noneOf: self specialFastaChars
]

{ #category : #'accessing private' }
BioFASTAParser >> specialFastaChars [
	" Answer a Collection with Characters with special meaning for the FASTA definition line format "
	
	^ Array 
		with: Character cr 
		with: Character lf
		with: $|
]

{ #category : #'accessing-parsers' }
BioFASTAParser >> tokenizeDescriptionLine [

	| separator token |

	separator := $| asPParser ==> [ : n | nil ].
	token := separator negate plus flatten.
	parser := (token separatedBy: separator) ==> [ :nodes | (nodes copyWithout: nil) collect: #trimBoth ].
	^ self parse: self expression
]

{ #category : #'accessing-parsers' }
BioFASTAParser >> tokenizeDescriptionText [

	^ self tokenizeDescriptionLine last
]
