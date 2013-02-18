callbacks
openFile
	" Private - Request XML file "
	
	BioObject requestXmlFile ifNotNilDo: [: fileName | 
		(BioObject openFullFileNamed: fileName)
			ifNotNilDo: [: fileStream | 	
				self queryManager addBlast: fileStream.
				self inform: 'Blast results successfully loaded' translated ]].
	