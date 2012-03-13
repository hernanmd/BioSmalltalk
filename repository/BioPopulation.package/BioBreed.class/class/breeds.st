accessing
breeds

	^ breeds
		ifNil: [
			self initialize.
			breeds ]