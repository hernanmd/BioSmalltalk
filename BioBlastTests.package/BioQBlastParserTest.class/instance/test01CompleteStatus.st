testing
test01CompleteStatus

	self assert: ( self statusParser parse: BioWebBlastSamples new bt064Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWebBlastSamples new bt061Txt ) = 'READY'.	
	self assert: ( self statusParser parse: BioWebBlastSamples new bt066Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWebBlastSamples new bt072Txt ) = 'READY'.		
	self assert: ( self statusParser parse: BioWebBlastSamples new bt073Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWebBlastSamples new bt074Txt ) = 'READY'.			