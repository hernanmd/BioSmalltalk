"
When download finish, presents a dialog to save results into a directory.


"
Class {
	#name : #BioNCBIGenBankUIReader,
	#superclass : #BioNCBIGenBankReader,
	#category : 'BioBlast-Remote'
}

{ #category : #accessing }
BioNCBIGenBankUIReader >> entrezSearchResults [

	^ contents select: #isEntrezSearchResult
]

{ #category : #accessing }
BioNCBIGenBankUIReader >> formatFilename: dir index: index [

	^ String streamContents: [: stream | 
			stream 
				nextPutAll: dir fullName;
				nextPutAll: self slash;
				nextPutAll: index asString;
				nextPutAll:  '.xml' ]
]

{ #category : #accessing }
BioNCBIGenBankUIReader >> saveFilterContents [
	" Private - Save receiver's contents if appropriate "

	| downloadStatus dir |
	downloadStatus := false.
	(contents notEmpty and: [ (dir := self requestDirectoryPath) notNil ])
		ifTrue: [ 
			self saveSplittedSearchResults: dir.
			self checkValidContents ifTrue: [ downloadStatus := true ] ]
		ifFalse: [ self error: 'Save cancelled' ].
	^ downloadStatus
]

{ #category : #accessing }
BioNCBIGenBankUIReader >> saveSplittedSearchResults: dir [
	self entrezSearchResults
		doWithIndex: [ :bioESearchResult :index | 
			| fileName |
			fileName := self formatFilename: dir index: index.
			self dumpToFileNamedFullPath: fileName contents: bioESearchResult ]
]
