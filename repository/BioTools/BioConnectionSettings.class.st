"
GTConnectionSettings is a rewrite of NetworkSystemSettings to allow any user of this object mantaining network connection setting on its own.

Instance Variables:
	useNetworkAuthentification	<ProtoObject | PseudoContext>
	email	<ProtoObject | PseudoContext>
	user	<ProtoObject | PseudoContext>
	password	<ProtoObject | PseudoContext>
	lastHTTPProxyPort	<ProtoObject | PseudoContext>
	lastHTTPProxyServer	<ProtoObject | PseudoContext>
	proxyPassword	<ProtoObject | PseudoContext>
	proxyUser	<ProtoObject | PseudoContext>
	useHTTPProxy	<ProtoObject | PseudoContext>
"
Class {
	#name : #BioConnectionSettings,
	#superclass : #BioObject,
	#instVars : [
		'serverAddress',
		'serverDirectory',
		'serverPort',
		'useNetworkAuthentification',
		'email',
		'user',
		'password',
		'lastProxyPort',
		'lastProxyServer',
		'proxyPassword',
		'proxyUser',
		'useProxy'
	],
	#category : #'BioTools-Core'
}

{ #category : #accessing }
BioConnectionSettings >> email [

	^ email
		ifNil: [ email := 'invalid@invalid.com' ]
]

{ #category : #accessing }
BioConnectionSettings >> email: anObject [
	email := anObject
]

{ #category : #accessing }
BioConnectionSettings >> lastProxyPort [
	^ lastProxyPort
]

{ #category : #accessing }
BioConnectionSettings >> lastProxyPort: anObject [
	lastProxyPort := anObject
]

{ #category : #accessing }
BioConnectionSettings >> lastProxyServer [
	^ lastProxyServer
]

{ #category : #accessing }
BioConnectionSettings >> lastProxyServer: anObject [
	lastProxyServer := anObject
]

{ #category : #accessing }
BioConnectionSettings >> password [
	^ password
]

{ #category : #accessing }
BioConnectionSettings >> password: anObject [
	password := anObject
]

{ #category : #accessing }
BioConnectionSettings >> proxyPassword [
	^ proxyPassword
]

{ #category : #accessing }
BioConnectionSettings >> proxyPassword: anObject [
	proxyPassword := anObject
]

{ #category : #accessing }
BioConnectionSettings >> proxyUser [
	^ proxyUser
]

{ #category : #accessing }
BioConnectionSettings >> proxyUser: anObject [
	proxyUser := anObject
]

{ #category : #accessing }
BioConnectionSettings >> serverAddress [
	^ serverAddress
]

{ #category : #accessing }
BioConnectionSettings >> serverAddress: anObject [
	serverAddress := anObject
]

{ #category : #accessing }
BioConnectionSettings >> serverDirectory [
	^ serverDirectory
]

{ #category : #accessing }
BioConnectionSettings >> serverDirectory: aString [
	" Set aString with the receiver's server directory to CWD "
	
	serverDirectory := aString
]

{ #category : #accessing }
BioConnectionSettings >> serverPort [
	^ serverPort
]

{ #category : #accessing }
BioConnectionSettings >> serverPort: anObject [
	serverPort := anObject
]

{ #category : #accessing }
BioConnectionSettings >> useNetworkAuthentication [
	^ useNetworkAuthentification
]

{ #category : #accessing }
BioConnectionSettings >> useNetworkAuthentication: anObject [
	useNetworkAuthentification := anObject
]

{ #category : #accessing }
BioConnectionSettings >> useProxy [
	^ useProxy
]

{ #category : #accessing }
BioConnectionSettings >> useProxy: anObject [
	useProxy := anObject
]

{ #category : #accessing }
BioConnectionSettings >> user [
	^ user
]

{ #category : #accessing }
BioConnectionSettings >> user: anObject [
	user := anObject
]
