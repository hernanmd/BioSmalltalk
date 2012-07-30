accessing-get
selectStatus
	" Private - Wait for the results until ready, answer <true> if results sent
	are ready and valid "
	
	| waiting |

	self shouldWaitForResults
		ifTrue: [ 
			waiting := self delaySeconds.
			self bioLog: 'QBLAST: Delaying retry for ' , waiting asString , ' seconds'.
			( Delay forSeconds: waiting ) wait.
			^  false
		].
	^ true

