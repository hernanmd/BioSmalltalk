"
Abstract class grouping behavior concerning repositories.

Instance Variables
	checkMD5:			<Boolean>
	client:				<Object>
	forceDownload:		<Boolean>
	connectionSettings: 	<BioConnectionSettings>


"
Class {
	#name : #BioDBObject,
	#superclass : #BioPropertyObject,
	#traits : 'BioFTPDownloader',
	#classTraits : 'BioFTPDownloader classTrait',
	#instVars : [
		'client',
		'forceDownload',
		'checkMD5',
		'connectionSettings'
	],
	#category : #'BioTools-Core'
}

{ #category : #accessing }
BioDBObject class >> databaseList [			
	" self databaseList "
	
	^ self subclasses collect: [ : cls | 
		cls dbName -> cls description ].

]

{ #category : #accessing }
BioDBObject class >> descriptionAt: aString [
	" Answer a <String> with the receiver's description for aString identifier "

	| answer |
	
	answer := self databaseList 
			detect: [ : assoc | assoc key = aString ]
			ifNone: [ nil ].
	^ answer
		ifNotNil: [ answer value ]
		ifNil: [ self nullName ]
]

{ #category : #accessing }
BioDBObject class >> nullName [
	" Answer a String representing a default name "
	
	^ 'Database not found'
]

{ #category : #accessing }
BioDBObject >> checkMD5 [
	^ checkMD5
]

{ #category : #accessing }
BioDBObject >> checkMD5: anObject [
	checkMD5 := anObject
]

{ #category : #accessing }
BioDBObject >> client [
	^ client
]

{ #category : #accessing }
BioDBObject >> client: anObject [

	client := anObject
]

{ #category : #accessing }
BioDBObject >> connectionSettings [

	^ connectionSettings
		ifNil: [ connectionSettings := BioConnectionSettings new ]
]

{ #category : #accessing }
BioDBObject >> connectionSettings: anObject [
	connectionSettings := anObject
]

{ #category : #accessing }
BioDBObject >> dbName [
	" Answer a String with the receiver's database name "
	
	^ self class dbName
]

{ #category : #accessing }
BioDBObject >> forceDownload [
	^ forceDownload
]

{ #category : #'initialize-release' }
BioDBObject >> serverDirectory [
	" Answer a String with the receiver's server directory to CWD "
	
	^ self connectionSettings serverDirectory

]

{ #category : #'initialize-release' }
BioDBObject >> serverName [
	" Answer a String with the receiver's server name "
	
	^ self connectionSettings serverAddress

]

{ #category : #'initialize-release' }
BioDBObject >> serverPassword [
	" Answer a String with the password to connect "

	^ self connectionSettings password

]

{ #category : #'initialize-release' }
BioDBObject >> serverUser [
	" Answer a String with the user name to connect "
	
	^ self connectionSettings user

]

{ #category : #downloading }
BioDBObject >> setForceDownload [
	" Force download even if there is a archive already on local directory. "
	
	forceDownload := true
]

{ #category : #actions }
BioDBObject >> summary [
	" Answer the result of the command applied on the receiver "

	^ self client summary
]

{ #category : #actions }
BioDBObject >> summaryAlternative [
	" Answer the result of the command applied on the receiver "

	^ self client summaryAlternative
]

{ #category : #'convenience-filesystem' }
BioDBObject >> workingDirectory [
	" Answer a String representing a directory name where the BLAST databases will be stored "	
	
	^ 'databases'
]
