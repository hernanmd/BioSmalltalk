accessing
allFinalClasses
	" Answer a <Collection> with receiver's leaf classes (classes without subclasses) "

	^ self allSubclasses select: [ : ea | ea subclasses isEmpty ]