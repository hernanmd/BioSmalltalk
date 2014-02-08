downloading
filesToDownload
	" Answer a Collection with the files to download "
		
	^ self connect
		ifNotNil: [ Array with: 'hs_alt_HuRef_chr' , self chrAsString , '.fa.gz' ]
		ifNil: [ self inform: 'Connection failed' translated ]