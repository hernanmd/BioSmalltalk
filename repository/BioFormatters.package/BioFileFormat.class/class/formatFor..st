accessing
formatFor: aString
	" Answer a <BioFileFormat> in the receiver's registry matching aString. Signal an exception if not found "

	| found |
	found  := self registry 
				detect: [: fmt | (fmt includesExtension: aString) or: [ fmt includesName: aString ]]
				ifNone: [ self signalNotFound: aString ].
	^ found
	

			