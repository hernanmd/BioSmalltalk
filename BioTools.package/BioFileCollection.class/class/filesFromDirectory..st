instance creation
filesFromDirectory: aDirectoryString
	" Answer a Collection of files iterating recursively over the files located at aDirectoryString "

	^ ((BioObject filesIn: aDirectoryString)
			collect: [ : entry | 
				entry isDirectory
					ifFalse: [ self fileClass on: entry ]
					ifTrue: [ self filesFromDirectory: entry fullName ] ]) joinUsing: Array new.