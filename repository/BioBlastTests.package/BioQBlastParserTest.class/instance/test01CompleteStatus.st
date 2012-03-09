testing
test01CompleteStatus

	self assert: ( self statusParser parse: BioWWWBlastSamples new bt064Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWWWBlastSamples new bt061Txt ) = 'READY'.	
	self assert: ( self statusParser parse: BioWWWBlastSamples new bt066Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWWWBlastSamples new bt072Txt ) = 'READY'.		
	self assert: ( self statusParser parse: BioWWWBlastSamples new bt073Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWWWBlastSamples new bt074Txt ) = 'READY'.			