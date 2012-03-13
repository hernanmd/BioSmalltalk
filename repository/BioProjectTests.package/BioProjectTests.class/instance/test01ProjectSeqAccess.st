testing
test01ProjectSeqAccess

	self assert: ( project sequences isKindOf: Collection ).
	self assert: ( project sequenceCount isKindOf: Number )