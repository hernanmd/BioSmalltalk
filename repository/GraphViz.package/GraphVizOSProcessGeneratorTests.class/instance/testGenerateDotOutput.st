testing
testGenerateDotOutput
	"Verify that that extern dot program produced expected output"

	| plain |
	plain := self historyOfSmalltalk asOutputType: #plain.
	self assert: ((plain last: 20) copyWithoutAll: (String cr, String lf)) = '58 solid blackstop'
