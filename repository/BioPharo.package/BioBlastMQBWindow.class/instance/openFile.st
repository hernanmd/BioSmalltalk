callbacks
openFile
	" Private - Request XML file "
	
	BioObject requestXmlFile
		ifNotNilDo: [: fileName | 
			self queryManager addBlast: (BioObject openFullFileNamed: fileName).
			self inform: 'Blast results successfully loaded' translated ].
	