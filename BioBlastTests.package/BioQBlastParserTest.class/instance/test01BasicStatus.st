testing
test01BasicStatus

	self assert: ( self statusParser parse: '<p><!--QBlastInfoBegin
	Status=READY
QBlastInfoEnd' ) = 'READY'.