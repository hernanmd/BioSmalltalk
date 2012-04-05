downloading
prvDownloadFileNamed: fileName binary: boolean
	" Private - Download fileName in the receiver's repository "

	| stream |

	self gtLog: 'Started download of ' , fileName.			
	stream := self newFileNamed: fileName.
	boolean ifTrue: [ stream binary ].
	stream nextPutAll: ( self client getFileNamed: fileName ).
	self gtLog: 'Completed download of ' , fileName.
	^ stream