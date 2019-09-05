"
Client class for the Tree of Life Web Services at http://tolweb.org

"
Class {
	#name : #BioTolWebClient,
	#superclass : #BioWebWrapper,
	#instVars : [
		'groupName',
		'nodeId'
	],
	#category : 'BioTolWeb-Core'
}

{ #category : #accessing }
BioTolWebClient class >> baseUrl [

	^ 'http://tolweb.org/onlinecontributors/app'
]

{ #category : #examples }
BioTolWebClient class >> exampleForBilateria [

	^ self new treeForGroup: 'Bilateria'.
]

{ #category : #accessing }
BioTolWebClient >> groupName [
	^ groupName
]

{ #category : #accessing }
BioTolWebClient >> groupName: anObject [
	groupName := anObject
]

{ #category : #'accessing public - commands' }
BioTolWebClient >> groupSearch [
	" Answer a list of UIDs with the corresponding data records "

	^ self execute: BioTolGroupSearchCommand
]

{ #category : #initialization }
BioTolWebClient >> initialize [
	" Private - Initialize the receiver's URL object "

	self 
		setServiceAsExternal;
		setPageAsXml
]

{ #category : #accessing }
BioTolWebClient >> nodeId [
	^ nodeId
]

{ #category : #accessing }
BioTolWebClient >> nodeId: anObject [
	nodeId := anObject
]

{ #category : #'accessing private' }
BioTolWebClient >> setPageAsXml [
	" Set ther receiver's result type as XML "

	self url queryAt: 'page' put: 'xml'
]

{ #category : #'accessing private' }
BioTolWebClient >> setServiceAsExternal [
	" Set ther receiver's service type as external "

	self url queryAt: 'service' put: 'external'
]

{ #category : #'accessing public - commands' }
BioTolWebClient >> treeForGroup: groupString [
	" Set ther receiver's node id for the tree structure service "

	self nodeId:  (self 
		groupName: groupString;
		groupSearch).
	self treeSearch

]

{ #category : #'accessing public - commands' }
BioTolWebClient >> treeSearch [
	" Answer a list of UIDs with the corresponding data records "

	^ self execute: BioTolTreeStructureCommand
]
