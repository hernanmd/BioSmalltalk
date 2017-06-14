defaults
defaultDownloadFormats
	" By default we download all types of formats found in the NCBI's FTP "

	^ { 
		self fastaFormatExtension .
		self gbkFormatExtension .
		self asnFormatExtension .
		self gbsFormatExtension .
		self mfaFormatExtension 
		}
