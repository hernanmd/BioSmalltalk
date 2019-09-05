Extension { #name : #FTPClient }

{ #category : #'*BioSupport' }
FTPClient >> getMdtm: fileName [
	" Syntax: MDTM remote-filename. Returns the last-modified time of the given file on the remote host in the format YYYYMMDDhhmmss : YYYY is the four-digit year, MM is the month from 01 to 12, DD is the day of the month from 01 to 31, hh is the hour from 00 to 23, mm is the minute from 00 to 59, and ss is the second from 00 to 59. "

	| modificationTime |
	
	self openPassiveDataConnection.
	self sendCommand: 'MDTM ' , fileName.
	modificationTime := self getData.
	self checkResponse.
	self checkResponse.
	^ modificationTime

]
