accessing
allFinalClasses

	^ self allSubclasses select: [:ea | ea subclasses isEmpty]