downloading
prvDownloadFileNamed: fileName binary: boolean
	" Private - Download fileName in the receiver's repository "

	| stream |

	self bioLog: 'Started download of ' , fileName.			
	stream := self newFileNamed: fileName.
	boolean ifTrue: [ stream binary ].
	stream nextPutAll: ( self client getFileNamed: fileName ).
	self bioLog: 'Completed download of ' , fileName.
	^ stream