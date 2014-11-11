testing
validateXMLDataSource: aString 
	" Raise an exception if aString path is not valid for the receiver "

	Cursor read showWhile: [ 
		(aString asFileReference hasFiles and: [ aString asFileReference entries allSatisfy: #isXML ])
			ifFalse: [ BioObject signalInvalidObject: 'Not all files in ' , aString asString , ' are XML or some of them are not recognized as XML format, please try again' ]
			ifTrue: [ self searchResults: (aString asFileReference entries collect: #asFileReference) ] ]