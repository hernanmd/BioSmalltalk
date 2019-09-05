Class {
	#name : #BioNCBILocalBlastLegacy2223,
	#superclass : #BioNCBILocalBlastWrapper,
	#category : 'BioBlast-Local'
}

{ #category : #testing }
BioNCBILocalBlastLegacy2223 class >> isLegacyVersion [

	^ true
]

{ #category : #accessing }
BioNCBILocalBlastLegacy2223 class >> versionNumber [
	" Answer a Number of the receiver's version "

	^ 2223
]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> bl2seqPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'bl2seq'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> blastAllPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'blastAll'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> blastClustPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'blastClust'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> blastPgpPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'blastPgp'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> copymatPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'copymat'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> fastaCmdPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'fastaCmd'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> formatDbPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'formatDb'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> formatRpsDbPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'formatRps'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> impalaPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: #knownImpalaNames 

]

{ #category : #private }
BioNCBILocalBlastLegacy2223 >> mainExecName [
	" Answer a String with the receiver's main executable name "
	
	^ 'blastall'
]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> makeMatPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'makeMat'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> megaBlastPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'megaBlast'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> rpsBlastPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'rpsBlast'

]

{ #category : #path }
BioNCBILocalBlastLegacy2223 >> seedTopPath [
	" Answer a String with the full path to the receiver's binary "
	
	^ self programNamed: 'seedTop'

]
