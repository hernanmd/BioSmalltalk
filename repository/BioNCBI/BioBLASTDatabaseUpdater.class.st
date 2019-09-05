"
Allows to download the pre-formatted BLAST databases requested from the NCBI ftp site. Downloads are validated against their MD5 checksum. This is a port of the Perl script update_blastdb.pl

To show all available pre-formatted BLAST databases evaluate the following expression. The output of this message lists the database names which should be used when requesting downloads or updates.

BioBLASTDatabaseUpdater new databases.

To display the output status of operations and set a timeout to 240 seconds (default is 120) you may send

BioBLASTDatabaseUpdater new 
	beVerbose;
	setTimeout: 240;
	databases.

and to stop having the displaying of details

BioBLASTDatabaseUpdater new 
	beQuiet.

To download the nr database (non-redundant protein sequence database with entries from GenPept, Swissprot, PIR, PDF, PDB, and NCBI RefSeq)

BioBLASTDatabaseUpdater new 
	database: 'nr';
	download.

to download a specific file

BioBLASTDatabaseUpdater new 
	download: 'pdbnt.tar.gz' 
"
Class {
	#name : #BioBLASTDatabaseUpdater,
	#superclass : #BioNCBIDownloader,
	#instVars : [
		'dbNames',
		'fileNames',
		'selectedDbName'
	],
	#category : 'BioNCBI-Databases'
}

{ #category : #updating }
BioBLASTDatabaseUpdater >> compressedDatabasesIn: aCollection [
	" Answer a Collection with items corresponding to recognized database files "
	
	^ aCollection lines select: [ : dbName | dbName endsWith: 'tar.gz' ]
]

{ #category : #accessing }
BioBLASTDatabaseUpdater >> database: aStringOrSymbol [
	" Set the receiver's working database "
	
	" Validate only if we have cached database names, may need work. "
	self dbNames isEmpty
		ifFalse: [ 
			( self dbNames includes: aStringOrSymbol )
				ifFalse: [ self signalInvalidObject: aStringOrSymbol , ' does not exist as database in the server' ] ].
	selectedDbName := aStringOrSymbol
]

{ #category : #updating }
BioBLASTDatabaseUpdater >> databases [
	" Answer a Collection with all available pre-formatted BLAST databases "
		
	self connect
		ifNotNil: [ self extractDatabaseNames: self client getFileList ]
		ifNil: [ self informMessage: 'Connection failed' translated ].
	self client close.
	^ self dbNames asSortedCollection
]

{ #category : #accessing }
BioBLASTDatabaseUpdater >> dbNames [
	" Answer a Collection for containing the receiver's database names "
	
	^ dbNames
		ifNil: [ dbNames := Set new: 50 ]
]

{ #category : #accessing }
BioBLASTDatabaseUpdater >> dbNames: anObject [
	dbNames := anObject
]

{ #category : #defaults }
BioBLASTDatabaseUpdater >> defaultDirectory [
	" Answer a String with the receiver's server directory to CWD "
	
	^ '/blast/db'

]

{ #category : #updating }
BioBLASTDatabaseUpdater >> extractDatabaseNames: aCollection [
	" Private - Set the receiver's database to contain only the names
	of the databases found in the repository "
	
	(self compressedDatabasesIn: aCollection)
		collect: [ : dbFullName | self dbNames add: (self extractDbNameIn: dbFullName) ]
]

{ #category : #updating }
BioBLASTDatabaseUpdater >> extractDbNameIn: dbName [
	" Private - Answer a String with only the database name "
	
	^ (dbName matchesRegex: '(.*)\.:isDigit::isDigit:\.tar\.gz')
		ifTrue: [ 
			| matcher |
			matcher := RxMatcher forString: '(.*)\.:isDigit::isDigit:\.tar\.gz'.
			(matcher matches: dbName)
				ifTrue: [ matcher subexpression: 2 ]
				ifFalse: [ self notify: 'Warning: Unexpected database name' ] ]
		ifFalse: [ ('(.*)\.tar\.gz' asRegex matchesIn: dbName) anyOne copyUpTo: $. ].
]

{ #category : #updating }
BioBLASTDatabaseUpdater >> extractFileNames: aCollection [
	" Private - Answer a String with only the file names for the choosen database "
	
	(self compressedDatabasesIn: aCollection)
		collect: [ : fileName | 
			(fileName matchesRegex: '^' , selectedDbName , '\..*')
				ifTrue: [ self fileNames add: fileName ] ]
]

{ #category : #accessing }
BioBLASTDatabaseUpdater >> fileNames [

	^ fileNames
		ifNil: [ fileNames := Set new: 200 ]	
]

{ #category : #downloading }
BioBLASTDatabaseUpdater >> filesToDownload [
	" Answer a Collection with the files to download "
		
	^ self connect
		ifNotNil: [ self extractFileNames: self client getFileList.			
			self fileNames asSortedCollection ]
		ifNil: [ self informMessage: 'Connection failed' translated ]
]

{ #category : #'initialize-release' }
BioBLASTDatabaseUpdater >> initialize [
	" Private - Initialize receiver's settings "
	
	super initialize.
	forceDownload := false.
	checkMD5 := true.
	self connectionSettings
			user: self defaultUser;
			password: self defaultPassword;
			serverAddress: self defaultServerName;
			serverDirectory: self defaultDirectory.
]

{ #category : #downloading }
BioBLASTDatabaseUpdater >> workingDirectory [
	" Private - See superimplementor's comment "
	
	^ 'blastdb'
]
