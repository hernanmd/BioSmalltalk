filesystem
fileDirectoryContentsFor: aDirectoryString
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	| path |
	
	path := [ self fileDirectoryClass on: aDirectoryString ]
	on: Error
	do: [: ex | 
		path := ( self fileDirectoryClass on: 
						self workingDirectory , 
						self fileDirectoryClass slash , 
						aDirectoryString ) ].
	^ path entries