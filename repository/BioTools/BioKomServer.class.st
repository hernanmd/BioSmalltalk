"
Adapter for The Comanche Http Server.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioKomServer,
	#superclass : #BioWebServerEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #testing }
BioKomServer class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ false
]

{ #category : #accessing }
BioKomServer class >> providerClass [
	" See superimplementor's comment "

	^ #HttpService
]

{ #category : #accessing }
BioKomServer class >> startWebServer [
	" See superimplementor's comment "

	| ma |
	ma := (self classFor: #ModuleAssembly) core.
	ma serverRoot: self serverRootDirectory.
	ma documentRoot: self documentRootDirectory.
	ma directoryIndex: 'index.html index.htm'.
	ma serveFiles.
	[ ((self classFor: self providerClass) startOn: 8081 named: 'httpd') plug: ma rootModule ]
	on: Error
	do: [ : ex | self notify: ex messageText ]
]

{ #category : #accessing }
BioKomServer class >> stopWebServer [
	" See superimplementor's comment "

	(self classFor: self providerClass) shutDown
]
