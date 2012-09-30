*BioTools
asAminoacidLetter
	" Answer a Character representing an aminoacid letter. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>
	
	self size = 1 ifFalse: [ BioObject signalInvalidObject: 'Receiver''s sequence size must match a Character' ].
	^ self at: 1