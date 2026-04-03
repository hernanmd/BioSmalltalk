Class {
	#name : 'BioCatalysis',
	#superclass : 'BioObject',
	#instVars : [
		'enzyme',
		'reaction',
		'michaelisConstant'
	],
	#category : 'BioSupport-Core',
	#package : 'BioSupport',
	#tag : 'Core'
}

{ #category : 'accessing' }
BioCatalysis >> enzyme [
	^ enzyme
]

{ #category : 'accessing' }
BioCatalysis >> enzyme: anObject [
	enzyme := anObject
]

{ #category : 'accessing' }
BioCatalysis >> michaelisConstant [
	^ michaelisConstant
]

{ #category : 'accessing' }
BioCatalysis >> michaelisConstant: anObject [
	michaelisConstant := anObject
]

{ #category : 'accessing' }
BioCatalysis >> reaction [
	^ reaction
]

{ #category : 'accessing' }
BioCatalysis >> reaction: anObject [
	reaction := anObject
]
