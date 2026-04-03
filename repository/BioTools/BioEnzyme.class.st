Class {
	#name : 'BioEnzyme',
	#superclass : 'BioProtein',
	#instVars : [
		'catalyses'
	],
	#category : 'BioTools-Restriction',
	#package : 'BioTools',
	#tag : 'Restriction'
}

{ #category : 'accessing' }
BioEnzyme >> addCatalysis: aBioCatalysis [
	(self catalyses includes: aBioCatalysis) ifFalse: [
		self catalyses add: aBioCatalysis.
		aBioCatalysis enzyme == self ifFalse: [ aBioCatalysis enzyme: self ] ]
}

{ #category : 'accessing' }
BioEnzyme >> catalyses [
	^ catalyses ifNil: [ catalyses := OrderedCollection new ]
}

{ #category : 'accessing' }
BioEnzyme >> catalyzesReaction: aBioReaction [
	^ self reactions includes: aBioReaction
}

{ #category : 'accessing' }
BioEnzyme >> michaelisConstantForReaction: aBioReaction [
	^ (self catalyses detect: [ :each | each reaction = aBioReaction ] ifNone: [ ^ nil ]) michaelisConstant
}

{ #category : 'accessing' }
BioEnzyme >> reactions [
	^ self catalyses collect: [ :each | each reaction ]
}
