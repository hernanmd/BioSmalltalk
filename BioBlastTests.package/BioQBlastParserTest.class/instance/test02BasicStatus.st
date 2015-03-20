testing
test02BasicStatus

	self assert: ( self statusParser parse: '<p><!--QBlastInfoBegin
	Status=WAITING
QBlastInfoEnd' ) = 'WAITING'.