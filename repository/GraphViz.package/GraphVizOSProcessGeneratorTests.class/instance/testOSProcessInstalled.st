testing
testOSProcessInstalled

	self assert: (Smalltalk hasClassNamed: #OSProcess).
	self assert: (Smalltalk hasClassNamed: #CommandShell)