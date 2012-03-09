testing
test02CompleteStatus

	self assert: ( self statusParser parse: BioWWWBlastSamples new blastcgiHtm ) = 'WAITING'.
	self assert: ( self statusParser parse: '


<p><!--QBlastInfoBegin
	Status=WAITING
QBlastInfoEnd
fafda0fdaf

afda+uf9dafdas' ) = 'WAITING'.	