convenience-behavior
updateBioSmalltalkFiles

	(Smalltalk hasClassNamed: #ConfigurationOfBioSmalltalk)
		ifTrue: [ (self classFor: #ConfigurationOfBioSmalltalk) project configuration preLoad ]
		ifFalse: [ ^ self informMessage: 'Cannot update BioSmalltalk because Configuration is not installed' ]