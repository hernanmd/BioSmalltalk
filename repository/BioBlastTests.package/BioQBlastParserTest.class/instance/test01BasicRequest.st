testing
test01BasicRequest

	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID=1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID = 1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID:1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID : 1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.