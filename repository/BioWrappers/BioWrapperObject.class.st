"
A wrapper is an object which expands on what another object (the wrappee) does, without being concerned about the implementation of the wrappee. A wrapper enables configuration and makes possible the messaging of another object (i.e. an external software).

You can add three types of things to a wrapped object:

- Parameters
- Options 		An option has only a name.
- Properties 		A property has a name and a value, delimited by a #propertySeparator

Wrappers responds to #execute message, answering a <BioResultObject>. Do not add #yourself after executing a wrapper. The key method for wrapper debugging is #buildCmdLine.

Instance Variables
	cmdLine:			<String>
	lastStatus:			<Boolean>
	options:				<OrderedCollection>
	parameters:			<OrderedCollection>
	programName:		<String>

cmdLine
	- xxxxx

lastStatus
	- <true> if last execution was successful.

options
	- xxxxx

parameters
	- xxxxx

programName
	- xxxxx

"
Class {
	#name : #BioWrapperObject,
	#superclass : #BioPropertyObject,
	#instVars : [
		'lastStatus',
		'options',
		'parameters',
		'programName',
		'cmdLine',
		'propertySeparator',
		'cwd',
		'isDoubleDashOptions',
		'isDoubleDashProperties'
	],
	#category : #'BioWrappers-Core'
}

{ #category : #accessing }
BioWrapperObject class >> availablePlatforms [
	" Answer a <Collection> of <String> with receiver's supported platforms. 
	Each supporteed platform name must be obtained through
	
	Smalltalk currentVersion. 
	Smalltalk os name.
	"
	
	self subclassResponsibility 
]

{ #category : #defaults }
BioWrapperObject class >> defaultProgramName [
	" Answer a <String> representing the name of the 'main' binary executable for the receiver "

	self subclassResponsibility 
]

{ #category : #private }
BioWrapperObject class >> invalidPlatform [
	" Perform an action after an invalid platform for the receiver was detected.
	Override if necessary "
	
	self informMessage: self softwareName , ' is not supported in the current platform: ' , Smalltalk os name.
]

{ #category : #testing }
BioWrapperObject class >> platformCheck [
	" Answer <true> if receiver can be executed in the current platform "
	
	^ self availablePlatforms includes: Smalltalk os name
]

{ #category : #accessing }
BioWrapperObject class >> releases [
	" Answer a <Collection> of <String> each representing a binary name version of the receiver "
	
	^ self allFinalClasses collect: #defaultProgramName
]

{ #category : #accessing }
BioWrapperObject class >> softwareName [
	" Answer a <String> with the receiver's friendly or known name "

	^ self subclassResponsibility 
]

{ #category : #accessing }
BioWrapperObject class >> url [
	" Answer a <String> representing receiver's URL "

	^ self subclassResponsibility
]

{ #category : #'accessing - private' }
BioWrapperObject >> addInputParameter: anObject [
	" Private - Add anObject to the receiver's options stack "

	self parameters addLast: '< ' , anObject
]

{ #category : #'accessing - private' }
BioWrapperObject >> addOption: aString [
	" Private - Add anObject to the receiver's options stack "

	self options addLast: aString
]

{ #category : #'accessing - private' }
BioWrapperObject >> addOption: optionName value: optionValue [
	" Private - Add optionName and optionValue to the receiver's options stack "

	self options addLast:  '-' , optionName , ' ' , optionValue.
]

{ #category : #'accessing - private' }
BioWrapperObject >> addOutputParameter: filename [
	" Private - Add filename to the receiver's options stack "

	self parameters addLast: ' > ' , filename
]

{ #category : #'accessing - private' }
BioWrapperObject >> addParameter: param [
	" Private - Add param to the receiver's parameters stack "

	self parameters addLast: param
]

{ #category : #'accessing - private' }
BioWrapperObject >> buildCmdLine [
	" Answer a <String> with receiver's full command line "
	
	^ String streamContents: [ : stream |
		self 
			buildProperties: stream;
			buildOptions: stream;
			buildParameters: stream ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> buildOptions: stream [

	self options do: [ : optString |
		stream space.	
		optString first = $-
			ifFalse: [ 
				optString size = 1
					ifTrue: [ stream nextPut: $- ]
					ifFalse: [ stream nextPutAll: '--' ] ].
		stream nextPutAll: optString ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> buildParameters: stream [
	" Append receiver's parameters delimited by space, to stream "

	self parameters do: [ : parString |
		stream space.	
		stream nextPutAll: parString ]
]

{ #category : #properties }
BioWrapperObject >> buildPath: fileName [

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self cwd;
			nextPutAll: fileName ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> buildProperties: stream [
	" Private - Append receiver's properties to stream "

	self properties
		ifNotNil: [ :arg | 
			self properties
				associationsDo: [ :assoc | 
					stream space.
					self buildPropertySeparator: assoc into: stream.
					self buildPropertyValue: assoc into: stream ] ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> buildPropertySeparator: assoc into: stream [
	"Private - Use a dash or double dash as property separator"

	self isDoubleDashProperties
		ifTrue: [ stream nextPutAll: '--' ]
		ifFalse: [ stream nextPut: $- ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> buildPropertyValue: assoc into: stream [
	" Private - Write the association assoc into stream "

	^ stream
		nextPutAll: assoc key asString;
		nextPut: self propertySeparator;
		nextPutAll: assoc value asString
]

{ #category : #'accessing - private' }
BioWrapperObject >> cmdLine [ 
	" Answer a <String> with the full command line for executing the receiver "

	cmdLine := String streamContents: [ : stream |
		stream 
			nextPutAll: self programName;
			nextPutAll: self buildCmdLine ].
	^ cmdLine
]

{ #category : #properties }
BioWrapperObject >> cwd [

	^ cwd
		ifNil: [ cwd := String empty ]
]

{ #category : #accessing }
BioWrapperObject >> cwd: anObject [
	cwd := anObject
]

{ #category : #defaults }
BioWrapperObject >> defaultParametersCollector [
	" Answer a <Collection> acting as holder for receiver's parameters "

	^ OrderedCollection new
]

{ #category : #defaults }
BioWrapperObject >> defaultProgramName [
	" Answer a <String> representing the name of the 'main' binary executable for the receiver "

	^ self class defaultProgramName 
]

{ #category : #defaults }
BioWrapperObject >> defaultPropertySeparator [
	" Answer a <Character> used as delimiter between property names and property values "

	^ $=
]

{ #category : #private }
BioWrapperObject >> execNameFor: aString [
	" Answer a String with the fully qualified name for programName, i.e. if programName is 'blast' then in Windows family the answer will be 'blast.exe' " 
	
	^ BioExecutionEngine execNameFor: aString

]

{ #category : #'accessing - public' }
BioWrapperObject >> execResult [
	" Execute the receiving action. Answer a <String> "
	
	^ self execute result

]

{ #category : #private }
BioWrapperObject >> execSelector [
	" Private - Answer a <Symbol> which specifies the appropriate selector to execute a command in the receiver's host system "

	self isRunningInWindows
		ifTrue: [ ^ self execSelectorForWindows ].
	self isRunningInUnix
		ifTrue: [ ^ self execSelectorForUnix ].
	self isRunningInMac
		ifTrue: [ ^ self execSelectorForMac ].
	^ self signalNotFound: 'Platform undetected'
]

{ #category : #private }
BioWrapperObject >> execSelectorForMac [
	" Private - Answer a <Symbol> representing a selector for performing a message in a Mac-box "
	
	^ #executeCommand:
]

{ #category : #private }
BioWrapperObject >> execSelectorForUnix [
	" Private - Answer a <Symbol> representing a selector for performing a message in a Unix-box "
	
	^ #executeCommand:
]

{ #category : #private }
BioWrapperObject >> execSelectorForWindows [

	^ self isExecCygwin
		ifTrue: [ #executeCygWin: ]
		ifFalse: [ #executeCommand: ]
]

{ #category : #'accessing - public' }
BioWrapperObject >> execute [
	" Execute the receiving action. Answer a <BioResultObject> "
	
	| execAnswer |
	execAnswer := BioExecutionEngine perform: self execSelector with: self cmdLine.
	^ BioResultObject new
		command: self cmdLine;
		result: execAnswer;
		yourself
		

]

{ #category : #'accessing - public' }
BioWrapperObject >> execute: anOperationClass [
	" Private - Execute the operation specified by anOperationClass "
	
	self bioLog: 'Executing...' , anOperationClass asString.
	^ (anOperationClass on: self copy) execute

]

{ #category : #'accessing - private' }
BioWrapperObject >> formatPlatformPath: aPath [
	" Private - Answe a <String> with the path properly formatted for the current platform "

	^ BioOSInterfaceEngine formatPlatformPath: aPath
]

{ #category : #testing }
BioWrapperObject >> isDoubleDashOptions [
	"Answer <true> if the receiver uses double dashes to specify options"

	^ isDoubleDashOptions
		ifNil: [ isDoubleDashOptions := true ]
]

{ #category : #testing }
BioWrapperObject >> isDoubleDashProperties [
	"Answer <true> if the receiver uses double dashes to specify options"

	^ isDoubleDashProperties
		ifNil: [ isDoubleDashProperties := true ]
]

{ #category : #private }
BioWrapperObject >> isExecCygwin [

	^ false
]

{ #category : #'accessing - public' }
BioWrapperObject >> lastStatus [
	" Answer a <Boolean> specifying last operation status "

	^ lastStatus
]

{ #category : #'accessing - public' }
BioWrapperObject >> lastStatus: aBoolean [
	" Set aBoolean specifying last operation status "

	lastStatus := aBoolean
]

{ #category : #'accessing - private' }
BioWrapperObject >> options [

	^ options
		ifNil: [ options := OrderedCollection new ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> options: anObject [
	options := anObject
]

{ #category : #accessing }
BioWrapperObject >> parameters [

	^ parameters
		ifNil: [ parameters := self defaultParametersCollector ]
]

{ #category : #accessing }
BioWrapperObject >> parameters: anObject [
	parameters := anObject
]

{ #category : #accessing }
BioWrapperObject >> programName [

	^ programName
		ifNil: [ programName := self execNameFor: self defaultProgramName ]
]

{ #category : #accessing }
BioWrapperObject >> programName: cmdString [
	" Set cmdString specifying command name "
	
	programName := cmdString
]

{ #category : #private }
BioWrapperObject >> programNamed: aString [
	"Answer a <String> with the full path to the receiver's binary "
	" (self locator userBinaries / (self execNameFor: programName)) resolve "

	^ BioExecutionEngine locateProgram: (self execNameFor: aString)

]

{ #category : #'accessing - private' }
BioWrapperObject >> propertySeparator [
	" Answer a <Character> with receiver's properties separator "

	^ propertySeparator
		ifNil: [ propertySeparator := self defaultPropertySeparator ]
]

{ #category : #'accessing - private' }
BioWrapperObject >> propertySeparator: aCharacter [
	" Set the receiver's delimiter between property name and values "

	^ propertySeparator := aCharacter
]

{ #category : #'accessing - private' }
BioWrapperObject >> scriptsFullDirectoryName [
	" Private - See comment in BioObject "
	
	^ BioObject scriptsFullDirectoryName
]

{ #category : #accessing }
BioWrapperObject >> url [
	" Answer a <String> representing receiver's URL "

	^ self class url
]

{ #category : #accessing }
BioWrapperObject >> useSingleDashOptions [
	"Specify the receiver will use single dash to specify options"

	isDoubleDashOptions := false
]

{ #category : #accessing }
BioWrapperObject >> useSingleDashProperties [
	"Specify the receiver will use single dash to specify property names"

	isDoubleDashProperties := false
]

{ #category : #accessing }
BioWrapperObject >> version [
	"Print version information and exit"

	 ^ self addOption: 'version'
]
