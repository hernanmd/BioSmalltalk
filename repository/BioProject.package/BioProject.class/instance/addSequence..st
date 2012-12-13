accessing-sequences
addSequence: aBioSequence
	" Add aBioSequence to the receiver's first job "
	
	self hasJobs
		ifFalse: [
			| newJob |
			newJob := BioJob new.
			newJob addSequence: aBioSequence.
			self addJob: newJob ]
		ifTrue: [
			| job |
			job := self jobs first.
			job addSequence: aBioSequence ].
	self info addSequence: aBioSequence.