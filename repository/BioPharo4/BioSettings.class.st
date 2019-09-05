"
I describe the customization points of the classes in the BioSmalltalk package, so that the Settings framework might collect them and populate a setting browser with them.

To open a setting browser on the settings available for the Boids package, evaluate:

(SettingBrowser forKeywords: #('bioPharoSettings')) open.

"
Class {
	#name : #BioSettings,
	#superclass : #Object,
	#classVars : [
		'FileExistsBehavior'
	],
	#category : 'BioPharo4-Core'
}

{ #category : #settings }
BioSettings class >> bioSettingsOn: aBuilder [
	<bioPharoSettings>

	(aBuilder group: #bio)
		label: 'BioSmalltalk Settings' translated;
		description: 'Settings related to BioSmalltalk'

]

{ #category : #accessing }
BioSettings class >> fileExistsBehavior [
	^ FileExistsBehavior
]

{ #category : #accessing }
BioSettings class >> fileExistsBehavior: anObject [
	FileExistsBehavior := anObject
]

{ #category : #accessing }
BioSettings class >> fileExistsBehaviors [
	^ { #abort . #okay . #retryWithOverwrite }
]

{ #category : #settings }
BioSettings class >> serializerClientOn: aBuilder [
	<bioPharoSettings>

	(aBuilder pickOne: #adapterClass)
		target: BioSerializationEngine;
		getSelector: #isPreferred;
		setSelector: #bePreferred:;
		label: 'Serialization client' translated;
		description: 'Set the serialization client package to be used' translated;
		parent: #bio;
		domainValues: BioSerializationEngine validAdapters
]

{ #category : #settings }
BioSettings class >> unzipBehaviorOn: aBuilder [
	<bioPharoSettings>

	(aBuilder pickOne: #adapterClass)
		target: self;
		getSelector: #fileExistsBehavior;
		setSelector: #fileExistsBehavior:;
		label: 'Unzip behavior' translated;
		description: 'Set the behavior when unzip files' translated;
		parent: #bio;
		domainValues: self fileExistsBehaviors
]

{ #category : #settings }
BioSettings class >> webClientOn: aBuilder [
	<bioPharoSettings>

	(aBuilder pickOne: #adapterClass)
		target: BioWebClientEngine;
		getSelector: #isPreferred;
		setSelector: #bePreferred:;
		label: 'Web client' translated;
		description: 'Set the web client package to be used' translated;
		parent: #bio;
		domainValues: BioWebClientEngine validAdapters
]
