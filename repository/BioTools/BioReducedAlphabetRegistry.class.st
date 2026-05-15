"
Registry of reduced alphabets providing lookup and enumeration. Instance Variables: classicAlphabets customAlphabets
"
Class {
	#name : 'BioReducedAlphabetRegistry',
	#superclass : 'BioObject',
	#instVars : [
		'classicAlphabets',
		'customAlphabets'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'BioTools-Alphabets',
	#package : 'BioTools',
	#tag : 'Alphabets'
}

{ #category : 'accessing' }
BioReducedAlphabetRegistry class >> allNames [

	^ self instance classicAlphabets keys
]

{ #category : 'private - requesting' }
BioReducedAlphabetRegistry class >> get: aName [

	^ self instance get: aName
]

{ #category : 'accessing' }
BioReducedAlphabetRegistry class >> instance [

	^ instance ifNil: [ instance := self new initialize ]
]

{ #category : 'initialization' }
BioReducedAlphabetRegistry class >> reset [

	instance := nil
]

{ #category : 'accessing' }
BioReducedAlphabetRegistry >> allNames [ ^ classicAlphabets keys asSortedCollection asArray
]

{ #category : 'accessing' }
BioReducedAlphabetRegistry >> classicAlphabets [ ^ classicAlphabets ifNil: [ classicAlphabets := self initializeClassicAlphabets ]
]

{ #category : 'accessing' }
BioReducedAlphabetRegistry >> createAlphabet: name size: sz source: src mapping: map [

	^ BioReducedAlphabet
		  fromMapping: map
		  name: name
		  size: sz
		  source: src
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> dayhoff6 [

	^ BioReducedAlphabet
		  fromMapping: self dayhoff6Mapping
		  name: #Dayhoff6
		  size: 6
		  source: #Dayhoff1978
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> dayhoff6Mapping [

	| m |
	m := Dictionary new.
	m at: $C put: $C.
	m at: $S put: $S.
	m at: $T put: $S.
	m at: $P put: $S.
	m at: $A put: $S.
	m at: $G put: $S.
	m at: $D put: $D.
	m at: $E put: $D.
	m at: $N put: $D.
	m at: $Q put: $D.
	m at: $H put: $H.
	m at: $R put: $H.
	m at: $K put: $H.
	m at: $I put: $I.
	m at: $L put: $I.
	m at: $M put: $I.
	m at: $V put: $I.
	m at: $F put: $F.
	m at: $Y put: $F.
	m at: $W put: $F.
	^ m
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> gbmr4 [

	| m |
	m := Dictionary new.
	m at: $A put: $H.
	m at: $V put: $H.
	m at: $I put: $H.
	m at: $L put: $H.
	m at: $M put: $H.
	m at: $F put: $H.
	m at: $R put: $P.
	m at: $K put: $P.
	m at: $H put: $P.
	m at: $D put: $N.
	m at: $E put: $N.
	m at: $S put: $S.
	m at: $T put: $S.
	m at: $N put: $S.
	m at: $Q put: $S.
	m at: $Y put: $S.
	m at: $W put: $S.
	m at: $G put: $S.
	m at: $P put: $S.
	m at: $C put: $S.
	^ BioReducedAlphabet
		  fromMapping: m
		  name: 'GBMR4'
		  size: 4
		  source: 'GBMR'
]

{ #category : 'private - requesting' }
BioReducedAlphabetRegistry >> get: aName [ | key | key := aName asString asUppercase. ^ self classicAlphabets at: key ifAbsent: [ self customAlphabets at: key ifAbsent: [ NotFound signalFor: aName ] ]
]

{ #category : 'initialization' }
BioReducedAlphabetRegistry >> initialize [ super initialize. classicAlphabets := nil. customAlphabets := Dictionary new
]

{ #category : 'initialization' }
BioReducedAlphabetRegistry >> initializeClassicAlphabets [
| d |
    d := Dictionary new.
    d at: #DAYHOFF6 put: self dayhoff6.
    d at: #MURPHY15 put: self murphy15.
    d at: #MURPHY10 put: self murphy10.
    d at: #MURPHY8 put: self murphy8.
    d at: #GBMR4 put: self gbmr4.
    d at: #WWMJ5 put: self wwmj5.
    ^ d
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> murphy10 [

	| m |
	m := Dictionary new.
	m at: $C put: $C.
	m at: $D put: $D.
	m at: $E put: $D.
	m at: $N put: $D.
	m at: $Q put: $Q.
	m at: $F put: $F.
	m at: $Y put: $F.
	m at: $W put: $F.
	m at: $H put: $H.
	m at: $I put: $I.
	m at: $L put: $I.
	m at: $M put: $I.
	m at: $V put: $I.
	m at: $K put: $K.
	m at: $R put: $K.
	m at: $A put: $A.
	m at: $G put: $A.
	m at: $P put: $A.
	m at: $S put: $A.
	m at: $T put: $A.
	^ BioReducedAlphabet
		  fromMapping: m
		  name: 'Murphy10'
		  size: 10
		  source: 'Murphy 2000'
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> murphy10Mapping [

	| m |
	m := Dictionary new.
	m at: $C put: $C.
	m at: $D put: $D.
	m at: $E put: $D.
	m at: $N put: $D.
	m at: $Q put: $Q.
	m at: $F put: $F.
	m at: $Y put: $F.
	m at: $W put: $F.
	m at: $H put: $H.
	m at: $I put: $I.
	m at: $L put: $I.
	m at: $M put: $I.
	m at: $V put: $I.
	m at: $K put: $K.
	m at: $R put: $K.
	m at: $A put: $A.
	m at: $G put: $A.
	m at: $P put: $A.
	m at: $S put: $A.
	m at: $T put: $A.
	^ m
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> murphy15 [

	^ BioReducedAlphabet
		  fromMapping: self murphy15Mapping
		  name: #Murphy15
		  size: 15
		  source: #Murphy2000
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> murphy15Mapping [

	| m |
	m := Dictionary new.
	m at: $C put: $C.
	m at: $D put: $D.
	m at: $E put: $D.
	m at: $F put: $F.
	m at: $Y put: $F.
	m at: $H put: $H.
	m at: $I put: $I.
	m at: $V put: $I.
	m at: $K put: $K.
	m at: $R put: $K.
	m at: $L put: $L.
	m at: $M put: $L.
	m at: $N put: $N.
	m at: $Q put: $N.
	m at: $P put: $P.
	m at: $S put: $S.
	m at: $T put: $S.
	m at: $W put: $W.
	m at: $A put: $A.
	m at: $G put: $A.
	^ m
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> murphy8 [
| m |
    m := Dictionary new.
    m at: $C put: $C.
    m at: $D put: $D.
    m at: $E put: $D.
    m at: $N put: $D.
    m at: $Q put: $D.
    m at: $F put: $F.
    m at: $Y put: $F.
    m at: $W put: $F.
    m at: $H put: $H.
    m at: $I put: $I.
    m at: $L put: $I.
    m at: $M put: $I.
    m at: $V put: $I.
    m at: $K put: $K.
    m at: $R put: $K.
    m at: $A put: $A.
    m at: $G put: $A.
    m at: $P put: $A.
    m at: $S put: $A.
    m at: $T put: $A.
    ^ BioReducedAlphabet fromMapping: m name: 'Murphy8' size: 8 source: 'Murphy 2000'
]

{ #category : 'accessing - alphabet' }
BioReducedAlphabetRegistry >> wwmj5 [
| m |
    m := Dictionary new.
    m at: $A put: 1.
    m at: $G put: 1.
    m at: $V put: 1.
    m at: $I put: 2.
    m at: $L put: 2.
    m at: $F put: 2.
    m at: $P put: 2.
    m at: $D put: 3.
    m at: $E put: 3.
    m at: $N put: 3.
    m at: $Q put: 3.
    m at: $S put: 3.
    m at: $T put: 3.
    m at: $K put: 4.
    m at: $R put: 4.
    m at: $H put: 4.
    m at: $M put: 5.
    m at: $C put: 5.
    m at: $W put: 5.
    m at: $Y put: 5.
    ^ BioReducedAlphabet fromMapping: m name: 'WWMJ5' size: 5 source: 'Wang et al'
]
