"
Adapter for the Zn HTTP server(s). Zinc HTTP Components is an open source Smalltalk framework to deal with HTTP.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioZnHTTPServer,
	#superclass : #BioWebServerEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #testing }
BioZnHTTPServer class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ true
]

{ #category : #accessing }
BioZnHTTPServer class >> providerClass [
	" See superimplementor's comment "

	^ #ZnManagingMultiThreadedServer
]

{ #category : #accessing }
BioZnHTTPServer class >> startWebServer [
	" See superimplementor's comment "

	((self classFor: self providerClass) startOn: self port)
		delegate: (ZnStaticFileServerDelegate new
			directory: self documentRootDirectory asFileReference;
			prefixFromString: 'static-files';
			yourself).

]

{ #category : #accessing }
BioZnHTTPServer class >> stopWebServer [
	" See superimplementor's comment "

	(self classFor: self providerClass) stop
]
