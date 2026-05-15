"
SmaCC-based scanner for PHYLIP format files. Tokenizes PHYLIP input for the parser.
"
Class {
	#name : 'BioPhylipScanner',
	#superclass : 'SmaCCScanner',
	#category : 'BioParsers-PHYLIP',
	#package : 'BioParsers',
	#tag : 'PHYLIP'
}

{ #category : 'instance creation' }
BioPhylipScanner class >> on: aStream [
    ^ self new stream: aStream; yourself
]

{ #category : 'private' }
BioPhylipScanner >> scanNameOrSequence [
    | start content |
    start := stream position.
    [ stream atEnd not and: [ 
        | c |
        c := stream peek.
        c isLetter or: [ c isDigit or: [ c = $. or: [ c = $- or: [ c = $? or: [ c = $_ ] ] ] ] ] ] ]
        whileTrue: [ stream next ].
    content := stream contents copyFrom: start + 1 to: stream position.
    ^ SmaCCToken value: content
]

{ #category : 'private - scanning' }
BioPhylipScanner >> scanNumber [
    | start num |
    start := stream position.
    [ stream atEnd not and: [ stream peek isDigit ] ] whileTrue: [ stream next ].
    stream skipSeparators.
    num := stream contents copyFrom: start + 1 to: stream position.
    ^ SmaCCToken value: num
]

{ #category : 'private - scanning' }
BioPhylipScanner >> scanToken [
    | char |
    stream atEnd ifTrue: [ ^ nil ].
    stream skipSeparators.
    stream atEnd ifTrue: [ ^ nil ].
    char := stream peek.
    ^ char isDigit
        ifTrue: [ self scanNumber ]
        ifFalse: [ 
            char isLetter or: [ char = $. or: [ char = $- or: [ char = $? ] ] ]
                ifTrue: [ self scanNameOrSequence ]
                ifFalse: [
                    char = Character lf or: [ char = Character cr ]
                        ifTrue: [ stream next. self scanToken ]
                        ifFalse: [ SmaCCToken value: stream next asString ] ] ]
]

{ #category : 'accessing' }
BioPhylipScanner >> stream: aStream [
    stream := aStream
]
