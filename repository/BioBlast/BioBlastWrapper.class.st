"
Main interface class for accessing to the BLAST software from BioSmalltalk. 

You may execute BLAST in several ways, for example :

- The NCBI BLAST running in the local machine, 
- In a remote NCBI server, 
- A local blast but using the Washington University version (WU-BLAST).

Running the local versions require you have installed previously the BLAST client on your machine.

"
Class {
	#name : #BioBlastWrapper,
	#superclass : #BioWrapperObject,
	#instVars : [
		'dbLocation'
	],
	#category : #'BioBlast-Local'
}

{ #category : #wrappers }
BioBlastWrapper class >> ncbi [
	"Answer a <Class> suitable for interfacing with the NCBI version of the receiver"
	
	^ BioNCBIBlastWrapper
]

{ #category : #'instance creation' }
BioBlastWrapper class >> newNCBILocalWrapper [

	^ self ncbi local latest
]

{ #category : #accessing }
BioBlastWrapper class >> wrappers [
	" Answer a <Collection> of selectors to access wrapped receiver's programs "
	
	^ self class organization listAtCategoryNamed: #wrappers
]

{ #category : #wrappers }
BioBlastWrapper class >> wu [
	" Answer a class suitable for interfacing with the WU version of the receiver "
	
	^ BioWUBlastWrapper
]

{ #category : #operations }
BioBlastWrapper >> database [

	^ self propertyAt: 'db'
]

{ #category : #'accessing private' }
BioBlastWrapper >> database: aDatabaseName [

	self propertyAt: 'db' put: aDatabaseName
]

{ #category : #accessing }
BioBlastWrapper >> dbLocation [
	"Answer a <FileReference> specifying the location of the database files"

	^ dbLocation
]

{ #category : #accessing }
BioBlastWrapper >> dbLocation: aString [
	"Set the location where the receiver will look for a BLAST database"

	dbLocation := aString.
	(self hasProperty: 'db')
		ifTrue: [ self database: (self dbLocation asFileReference / self database) fullName ]

]

{ #category : #'accessing - public' }
BioBlastWrapper >> execute [
	"Execute the receiver configured action. Answer a <BioResultObject>"
	
	| execAnswer |

	execAnswer := BioExecutionEngine perform: self execSelector with: self cmdLine.
	^ BioResultObject new
		command: self cmdLine;
		result: execAnswer;
		yourself
]

{ #category : #testing }
BioBlastWrapper >> isPresent [
	" Answer <true> if the receiver's is actually installed in the system "
	
	^ (self programNamed: self mainExecName) notNil
]

{ #category : #testing }
BioBlastWrapper >> mainExecName [
	"Answer a <String> with the name of the receiver's executable"
	
	self subclassResponsibility
]
