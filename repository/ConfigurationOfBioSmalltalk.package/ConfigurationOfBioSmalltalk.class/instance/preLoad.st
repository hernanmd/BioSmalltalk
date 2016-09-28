doits
preLoad

	| urlIndex |
	urlIndex := 1.
	self logCr: '====== Downloading BioSmalltalk resource files...'.	
	[ self downloadFiles: urlIndex ]
	on: ZdcPluginMissing
	do: [ : ex | 
		urlIndex := urlIndex + 1.
		ex retry ].
	self logCr: '====== Uncompressing files...'.	
	self uncompressFiles.