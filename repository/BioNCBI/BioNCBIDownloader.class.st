Class {
	#name : #BioNCBIDownloader,
	#superclass : #BioDBObject,
	#category : 'BioNCBI-Databases'
}

{ #category : #defaults }
BioNCBIDownloader >> defaultServerName [
	" Answer a String with the receiver's server name "
	
	^ 'ftp.ncbi.nlm.nih.gov'

]

{ #category : #downloading }
BioNCBIDownloader >> download [
	" Download the requested files only if they are missing or if they are newer in the remote site. "
	
	self filesToDownload do: [ : fileName | self prvDownload: fileName ].
	self bioLog: 'Downloads completed successfully'.

	 
]

{ #category : #updating }
BioNCBIDownloader >> setTimeout: seconds [
	" Timeout on connection to NCBI (default: 120 seconds). "
]
