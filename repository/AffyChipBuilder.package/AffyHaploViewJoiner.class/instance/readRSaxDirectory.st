accessing
readRSaxDirectory

	df := Dictionary new.
	self sourceDirectory asFileReference entries doWithIndex: [ : entry : index |
		self readRSaxFile: entry index: index	].
