adding
addFolder: aFoldername

	aFoldername asFilename filesDo: [ :each |
		self addFile: each ]