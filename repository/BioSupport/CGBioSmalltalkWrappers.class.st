"
Helper class for automatic code generation of wrappers
"
Class {
	#name : #CGBioSmalltalkWrappers,
	#superclass : #CGBioSmalltalk,
	#category : 'BioSupport-Generators'
}

{ #category : #'instance creation' }
CGBioSmalltalkWrappers class >> on: aPath [ 
	" Answer a new instance of the receiver "
	
	^ self new initializeParser: aPath
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> buildClassNames: row [
	" Private - Build receiver's wrapper class names from row "
	
	| newClsName newClsTestName |
	
	newClsName := self newClassPrefix , row first , self newClassPostfix.
	newClsTestName := self newClassPrefix , row first , self newClassTestPostfix.
	self generateClass: newClsName.
	self generateTestClass: newClsTestName.
	self targetClass: (self classFor: newClsName).
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> buildSelector: row [
	" Private - Parse the row corresponding to an option "
	
	| mthSelector mthParameter selector |

	((mthSelector := row first) includes: $=)
		ifTrue: [ 
			selector := mthSelector copyUpTo: $=.
			mthParameter := (mthSelector  findBetweenSubStrs: '<>') last.
			self targetSelector: selector withArgument: mthParameter ]
		ifFalse: [ self targetSelector: mthSelector ].
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> generateClasses [
	" Private - Generate receiver's classes "

	self parser rowsDo: [: row | 
		| methods |

		self buildClassNames: row.
		methods := row second findTokens: ','.
		self generateMethods: methods source: methods.
		self targetSelector: 'url';
				 sourceString: row third;
				 generateMethod ]


]

{ #category : #accessing }
CGBioSmalltalkWrappers >> generateMethod [
	" Write the code "

	self preGenerateForOptions.
	self compileCodeStream.
	self postGenerate.
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> generateOptionMethodBody [
	" Private - Write the method body into the code stream "

	codeStream nextPutAll: ' ^ '.
	(self targetSelector includes: $:)
		ifFalse: [ 
			codeStream
				nextPutAll: 'self addOption: ''';
				nextPutAll: self targetSelector;
				nextPutAll: '''' ]
		ifTrue: [
			codeStream
				nextPutAll: 'self propertyAt: ''';
				nextPutAll: (self targetSelector copyUpTo: $:);
				nextPutAll: ''' ifAbsentPut: [';
				nextPutAll: (self targetSelector findTokens: ':') last;
				nextPutAll: ' ]' ]
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> generateOptions [
	" Private - Generate receiver's option methods "

	self parser rowsDo: [: row | 
		self buildSelector: row.		
		self 
			userComment: row second;
			sourceString: String empty;
			generateMethod  ]


]

{ #category : #accessing }
CGBioSmalltalkWrappers >> newClassPostfix [
	" Private - Answer a <String> with the postfix name for the new created classes "
	
	^ 'Wrapper'
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> newClassTestPostfix [
	" Private - Answer a <String> with the postfix name for the new created classes "
	
	^ self newClassPostfix , 'Test'
]

{ #category : #accessing }
CGBioSmalltalkWrappers >> preGenerateForOptions [
	" Private - Configure system receiver's internal settings before compilation "
	
	self initializeCodeStream.
	self disableCompilationLogging.
	self cleanTarget.	
	self setAuthoring.
	self generateMethodHeader.
	self generateOptionMethodBody.
]
