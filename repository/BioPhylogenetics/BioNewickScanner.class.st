"
I am the SmaCC-generated scanner (tokenizer) paired with BioNewickSmaCCParser, produced by SmaCCGrammarCompiler. I am not meant to be used directly.
"
Class {
	#name : 'BioNewickScanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioPhylogenetics-Parsers',
	#package : 'BioPhylogenetics',
	#tag : 'Parsers'
}

{ #category : 'generated' }
BioNewickScanner >> emptySymbolTokenId [

	^ 15
]

{ #category : 'generated' }
BioNewickScanner >> errorTokenId [

	^ 16
]

{ #category : 'generated' }
BioNewickScanner >> scan1 [

	[
		self recordMatch: #( 6 7 ).
		self step.
		currentCharacter == $. ifTrue: [
				self recordMatch: #( 7 ).
				self step.
				currentCharacter isDigit ifTrue: [
						[
							self recordMatch: #( 6 7 ).
							self step.
							currentCharacter isDigit ] whileTrue ].
				(currentCharacter <= Character arrowDown or: [
						 (currentCharacter between: $! and: $&) or: [
								 (currentCharacter between: $* and: $+) or: [
										 (currentCharacter between: $- and: $/) or: [
												 (currentCharacter between: $< and: $Z) or: [
													 currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ] ])
					ifTrue: [
							[
								self recordMatch: #( 7 ).
								self step.
								currentCharacter <= Character arrowDown or: [
										(currentCharacter between: $! and: $&) or: [
												(currentCharacter between: $* and: $+) or: [
														(currentCharacter between: $- and: $9) or: [
																(currentCharacter between: $< and: $Z) or: [
																	currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ] ] ]
								whileTrue ].
				^ self reportLastMatch ].
		currentCharacter isDigit ] whileTrue.
	(currentCharacter <= Character arrowDown or: [
			 (currentCharacter between: $! and: $&) or: [
					 (currentCharacter between: $* and: $+) or: [
							 (currentCharacter between: $- and: $/) or: [
									 (currentCharacter between: $< and: $Z) or: [
										 currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ] ])
		ifTrue: [
				[
					self recordMatch: #( 7 ).
					self step.
					currentCharacter <= Character arrowDown or: [
							(currentCharacter between: $! and: $&) or: [
									(currentCharacter between: $* and: $+) or: [
											(currentCharacter between: $- and: $9) or: [
													(currentCharacter between: $< and: $Z) or: [
														currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ] ] ]
					whileTrue ].
	^ self reportLastMatch
]

{ #category : 'generated' }
BioNewickScanner >> scanForToken [

	self step.
	currentCharacter == Character space ifTrue: [ ^ self scanForTokenX3 ].
	^ self scanForTokenX4
]

{ #category : 'generated' }
BioNewickScanner >> scanForTokenX1 [

	[
		self recordMatch: #( 7 8 ).
		self step.
		currentCharacter == Character space ifTrue: [
				[
					self recordMatch: #( 8 ).
					self step.
					currentCharacter isSeparator or: [
						currentCharacter == Character pageUp ] ] whileTrue.
				^ self reportLastMatch ].
		currentCharacter isSeparator or: [
			currentCharacter == Character pageUp ] ] whileTrue.
	(currentCharacter <= $& or: [
			 (currentCharacter between: $* and: $+) or: [
					 (currentCharacter between: $- and: $9) or: [
							 (currentCharacter between: $< and: $Z) or: [
								 currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ])
		ifTrue: [
				[
					self recordMatch: #( 7 ).
					self step.
					currentCharacter <= Character arrowDown or: [
							(currentCharacter between: $! and: $&) or: [
									(currentCharacter between: $* and: $+) or: [
											(currentCharacter between: $- and: $9) or: [
													(currentCharacter between: $< and: $Z) or: [
														currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ] ] ]
					whileTrue ].
	^ self reportLastMatch
]

{ #category : 'generated' }
BioNewickScanner >> scanForTokenX2 [

	[
		self recordMatch: #( 7 ).
		self step.
		currentCharacter <= Character arrowDown or: [
				(currentCharacter between: $! and: $&) or: [
						(currentCharacter between: $* and: $+) or: [
								(currentCharacter between: $- and: $9) or: [
										(currentCharacter between: $< and: $Z) or: [
											currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ] ] ] ] ]
		whileTrue
]

{ #category : 'generated' }
BioNewickScanner >> scanForTokenX3 [

	[
		self recordMatch: #( 8 ).
		self step.
		currentCharacter isSeparator or: [
			currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : 'generated' }
BioNewickScanner >> scanForTokenX4 [

	currentCharacter == $( ifTrue: [ ^ self recordAndReportMatch: #( 1 ) ].
	currentCharacter == $) ifTrue: [ ^ self recordAndReportMatch: #( 2 ) ].
	currentCharacter == $, ifTrue: [ ^ self recordAndReportMatch: #( 3 ) ].
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #( 4 ) ].
	currentCharacter == $; ifTrue: [ ^ self recordAndReportMatch: #( 5 ) ].
	(currentCharacter isSeparator or: [
		 currentCharacter == Character pageUp ]) ifTrue: [
		^ self scanForTokenX1 ].
	currentCharacter isDigit ifTrue: [ ^ self scan1 ].
	(currentCharacter <= $& or: [
			 (currentCharacter between: $* and: $Z) or: [
				 currentCharacter == $\ or: [ currentCharacter >= $^ ] ] ])
		ifTrue: [ self scanForTokenX2 ].
	^ self reportLastMatch
]

{ #category : 'generated' }
BioNewickScanner >> tokenActions [

	^ #( nil nil nil nil nil nil nil #whitespace )
]
