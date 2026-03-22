"
Defines the interface and abstract behavior for Adapters. An adapter is composed of a ""provider"" which refers to the external class (the adaptee). 

# Usage

Refer to the the corresponding adapter superclass, omitting specific adapter subclasses. For example, to serialize your objects, use:

```language=Pharo
BioSerializationEngine serialize: anObject.
```
Instead of 

```language=Pharo
BioFLSerializer ...
BioSIXXSerializer ..
```

Another example, to get the contents at an URL:

```language=Pharo
(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
```
"
Class {
	#name : 'BioAbstractAdapter',
	#superclass : 'BioObject',
	#instVars : [
		'provider'
	],
	#classInstVars : [
		'isPreferred'
	],
	#category : 'BioTools-Adapters',
	#package : 'BioTools',
	#tag : 'Adapters'
}

{ #category : 'accessing-adapters' }
BioAbstractAdapter class >> adapter [
	" Answer an instance of the preferred subclass for providing the receiver's services "
	
	^ self adapterClass new
]

{ #category : 'instance creation' }
BioAbstractAdapter class >> adapterClass [
	"Answer the preferred subclass for providing the receiver's services."

	| preferred |
	preferred := self preferredAdapterClassForCurrentPlatform.
	preferred ifNotNil: [
		(self validAdapters includes: preferred) ifTrue: [ ^ preferred ] ].

	^ self validAdapters
		detect: [ :cls | cls isPreferredAdapter ]
		ifNone: [
			self validAdapters
			ifEmpty: [ self signalInvalidObject: 'No provider was found' ]
			ifNotEmpty: [ :adapters | adapters first ] ]
]

{ #category : 'accessing' }
BioAbstractAdapter class >> bePreferred: aClass [
	" Set aClass as preferred adapter to use "

	aClass notNil ifTrue: [ 
		isPreferred := aClass ]
]

{ #category : 'accessing' }
BioAbstractAdapter class >> defaultProviderClass [
	" Private - Answer the <Class> of the preferred provider subclass "
	
	^ self hasAnyProvider
		ifTrue: [ 
			| adapterClass |
			adapterClass := self allFinalClasses detect: #isPreferredAdapter.
			self classFor: adapterClass providerClass ]
		ifFalse: [ self signalInvalidObject: 'No provider was found' ] 
]

{ #category : 'testing' }
BioAbstractAdapter class >> hasAnyProvider [
	" Answer <true> if the receiver is available in this system "
	
	^ self allFinalClasses anySatisfy: [ : cls | cls providerIsAvailable ]
]

{ #category : 'testing' }
BioAbstractAdapter class >> isGTImage [
	"Answer whether the current image is a Glamorous Toolkit image."

	^ Smalltalk globals includesKey: #GtImage
]

{ #category : 'testing' }
BioAbstractAdapter class >> isPharoImage [
	"Answer whether the current image is a standard Pharo image (including GT, unless explicitly handled)."

	^ self isGTImage not
]

{ #category : 'accessing' }
BioAbstractAdapter class >> isPreferred [

	^ isPreferred

]

{ #category : 'testing' }
BioAbstractAdapter class >> isPreferredAdapter [
	" Private - Answer <true> if the receiver is the best option for the current image and platform "

	^ false
]

{ #category : 'private' }
BioAbstractAdapter class >> preferredAdapterClassForCurrentPlatform [
	"Answer the adapter class that best matches the current image/platform.
	Prefer modern subprocess engines on Pharo/GToolkit, keep legacy engines as fallback."

	| os |
	os := BioOSInterfaceEngine adapter.

	(self isGTImage and: [ os isRunningInUnix ]) ifTrue: [
		^ BioGtUnixSubprocess ].

	(self isPharoImage and: [ os isRunningInUnix ]) ifTrue: [
		^ OSSUnixSubprocess ].

	^ nil
]

{ #category : 'accessing' }
BioAbstractAdapter class >> providerClass [
	" Answer a <Symbol>, the main external class name for this adapter "

	self subclassResponsibility
]

{ #category : 'testing' }
BioAbstractAdapter class >> providerIsAvailable [
	" Answer <true> if the receiver is available in this system "

	^ (Smalltalk hasClassNamed: self providerClass asString) or: [ 
		  Smalltalk globals includesKey: self providerClass asSymbol ]
]

{ #category : 'accessing-adapters' }
BioAbstractAdapter class >> validAdapters [
	" Answer a Collection with all the subclasses for which there is a provider installed in this system "
	
	^ self allSubclasses select: #providerIsAvailable

]

{ #category : 'initialize-release' }
BioAbstractAdapter >> initializeWith: aProvider [
	" Private - Initialize the receiver with aProvider "
	
	self provider: aProvider
]

{ #category : 'accessing' }
BioAbstractAdapter >> provider [
	^ provider
]

{ #category : 'accessing' }
BioAbstractAdapter >> provider: anObject [
	provider := anObject
]

{ #category : 'accessing' }
BioAbstractAdapter >> providerClass [
	" See class side comment "
	^ self class providerClass
]
