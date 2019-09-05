Class {
	#name : #BioAdapterTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'adapter'
	],
	#category : 'BioToolsTests-Core'
}

{ #category : #accessing }
BioAdapterTest >> adapterEngines [
	" Answer a <Collection> of Engine classes "

	^ { 
		BioWebClientEngine . 
		BioSerializationEngine .
		BioExecutionEngine .
		BioOSInterfaceEngine
		}
]

{ #category : #accessing }
BioAdapterTest >> checkTestWebServer [
	^ (BioWebServerEngine hasAnyProvider
		and: [ self confirm: 'Do you want to start a local web server for testing the web adapters?' ])
		ifTrue: [ 
			self startTestWebServer.
			self urlTestAddress ]
		ifFalse: [ 
			(self confirm: 'No web server available, do you agree to use ' , self defaultUrlTestAddress , ' for testing the adapter')
				ifTrue: [ self defaultUrlTestAddress ]
				ifFalse: [ 
					BioObject signalNotFound: 'Unable to test Web Adapters'.
					self nullUrlAddress ] ]
]

{ #category : #accessing }
BioAdapterTest >> defaultUrlTestAddress [

	^ 'http://www.loremipsum.com/'
]

{ #category : #accessing }
BioAdapterTest >> isRunningTestWebServer [
	" Answer <true> if system is running a web server "

	^ BioWebServerEngine isRunningTestWebServer
]

{ #category : #accessing }
BioAdapterTest >> nullUrlAddress [

	^ String empty
]

{ #category : #accessing }
BioAdapterTest >> startTestWebServer [
	" Private - Start the testing web server "
	
	BioWebServerEngine startWebServer
]

{ #category : #accessing }
BioAdapterTest >> stopTestWebServer [
	" Private - Stop the testing web server "

	BioWebServerEngine hasAnyProvider
		ifTrue: [ BioWebServerEngine stopWebServer ]
]

{ #category : #accessing }
BioAdapterTest >> tearDown [

	super tearDown.
	self stopTestWebServer
]

{ #category : #testing }
BioAdapterTest >> test02Providers [

	self adapterEngines do: [: sCls | 
		self should: [ sCls providerClass ] raise: Error.
		self assert: ( sCls allSubclasses allSatisfy: [: cls | cls respondsTo: #providerClass ] ).
		self assert: ( sCls validAdapters allSatisfy: [ : cls | ( BioObject classFor: cls providerClass ) isBehavior ] ).		
		self assert: ( sCls hasAnyProvider isKindOf: Boolean ).		
		sCls hasAnyProvider
			ifTrue: [	
				self assert: ( sCls allSubclasses anySatisfy: [: cls | Smalltalk hasClassNamed: cls providerClass asString ] ) ]
			ifFalse: [
				self deny: ( sCls allSubclasses anySatisfy: [: cls | Smalltalk hasClassNamed: cls providerClass asString ] ) ] 
		].
]

{ #category : #testing }
BioAdapterTest >> test03Adapters [

	self adapterEngines do: [: sCls | 
		sCls validAdapters isEmpty
			ifFalse: [ self assert: sCls adapterClass isBehavior.
					self deny: sCls adapter isBehavior ] ].


]

{ #category : #testing }
BioAdapterTest >> testFormatOSInterfaceAdapter [

	| answer |
	
	answer := BioOSInterfaceEngine formatPlatformPath: 'C:\Archivos de Programa'.
	
	BioObject isRunningInWindows
		ifTrue: [ self assert: answer = '"C:\Archivos de Programa"' ].


]

{ #category : #testing }
BioAdapterTest >> testProviderClass [

	| concreteAdapters |
	
	concreteAdapters := BioAbstractAdapter allFinalClasses.
	self deny: concreteAdapters isEmpty.
	self assert: (concreteAdapters allSatisfy: [: adptClass | adptClass respondsTo: #providerClass ]).
	self assert: (concreteAdapters allSatisfy: [: adptClass | adptClass providerClass isKindOf: Symbol ]).

]

{ #category : #testing }
BioAdapterTest >> testSettingSerializationAdapter [

	self assert: ( BioSerializationEngine hasAnyProvider isKindOf: Boolean ).
	
	( BioSerializationEngine hasAnyProvider isKindOf: Boolean )
		ifFalse: [ self inform: 'Cannot test serialization engine, no providers available' translated ]
		ifTrue: [ 
			adapter := BioSerializationEngine for: 'testSerialize.obj'.

			self deny: adapter location isNil.
			self deny: adapter provider isNil ]

			


]

{ #category : #testing }
BioAdapterTest >> testSettingWebClientAdapter [

"	| testAddress |
	
	( testAddress := self urlTestAddress ) = self nullUrlAddress
		ifFalse: [
			adapter := BioWebClientEngine for: testAddress.
			self deny: adapter provider isNil.
			self deny: adapter provider isBehavior.
			self assert: ( adapter provider isKindOf: ( self classFor: BioWebClientEngine adapter providerClass ) ).
			testAddress = self defaultUrlTestAddress 
				ifFalse: [ BioWebClientEngine stopWebServer ] ]."


			


]

{ #category : #testing }
BioAdapterTest >> testUsingOSInterfaceAdapter [

	self assert: ( BioOSInterfaceEngine hasAnyProvider isKindOf: Boolean ).
	
	( BioOSInterfaceEngine hasAnyProvider isKindOf: Boolean )
		ifFalse: [ self inform: 'Cannot test OS interface engine, no providers available' translated ]
		ifTrue: [ 
			adapter := BioOSInterfaceEngine adapter.
			self deny: adapter isNil.].

	self assert: ( adapter isRunningInWindows isKindOf: Boolean ).
	self assert: ( adapter isRunningInUnix isKindOf: Boolean ).
	self assert: ( adapter isRunningInMac isKindOf: Boolean)
			


]

{ #category : #testing }
BioAdapterTest >> testUsingWebClientAdapter [

"	| testAddress |
	
	( testAddress := self urlTestAddress ) = self nullUrlAddress
		ifFalse: [
			adapter := BioWebClientEngine for: testAddress .
			self deny: adapter url isNil.
			self assert: adapter url = testAddress. 
			self assert: adapter downloadUrl = testAddress.
			self assert: adapter responseType isBehavior.
			self assert: ( adapter httpGet isKindOf: adapter responseType ).
			self assert: ( adapter httpGetContents isKindOf: String ) ]."

]

{ #category : #testing }
BioAdapterTest >> testWebDecodeUrl [

	| decoded encodedAddress decodedAddress |
	
	" WebClient "
	decodedAddress := 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	encodedAddress := 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi%3Fdb%3Dnuccore%26term%3Dscience%5Bjournal%5D%2BAND%2Bbreast%2Bcancer%2BAND%2B2009%5Bpdat%5D'.
	decoded := BioWebClientEngine decode: encodedAddress.

	self deny: decoded isNil.
	self assert: ( decoded isKindOf: String ). 
	self assert: decoded = decodedAddress.

	" Zn "
	decoded := BioWebClientEngine decode: encodedAddress.

	self deny: decoded isNil.
	self assert: ( decoded isKindOf: String ). 
	self assert: decoded = decodedAddress.
	
	" HTTPClient "
	decoded := BioWebClientEngine decode: encodedAddress.

	self deny: decoded isNil.
	self assert: ( decoded isKindOf: String ). 
	self assert: decoded = decodedAddress.
]

{ #category : #accessing }
BioAdapterTest >> urlTestAddress [
	" Answer a String representing an URL for testing purposes "

	^ self isRunningTestWebServer
		ifTrue: [ 'http://localhost:' , BioWebServerEngine port ]
		ifFalse: [ self checkTestWebServer ]
]
