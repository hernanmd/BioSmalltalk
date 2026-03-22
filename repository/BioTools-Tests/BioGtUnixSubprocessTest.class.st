"
Tests for BioGtUnixSubprocess execution API compatibility.
"
Class {
	#name : 'BioGtUnixSubprocessTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Adapters',
	#package : 'BioTools-Tests',
	#tag : 'Adapters'
}

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandChained [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "echo bio&&echo smalltalk"' ]
		ifFalse: [ 'sh -c ''echo bio; echo smalltalk''' ].
	output := BioGtUnixSubprocess executeCommand: command.
	self assert: (output includesSubstring: 'bio').
	self assert: (output includesSubstring: 'smalltalk')
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandEcho [
	| output |

	output := BioGtUnixSubprocess executeCommand: 'echo biosmalltalk'.
	self assert: (output includesSubstring: 'biosmalltalk')
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandFailureReturnsErrorOutput [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "nonexistent_command_12345"' ]
		ifFalse: [ 'sh -c ''nonexistent_command_12345''' ].
	output := BioGtUnixSubprocess executeCommand: command.
	self deny: output isEmpty
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandParameter [
	| output |

	output := BioGtUnixSubprocess
		executeCommand: 'echo'
		parameter: 'biosmalltalk'.
	self assert: (output includesSubstring: 'biosmalltalk')
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandPipeline [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "echo biosmalltalk | findstr /c:biosmalltalk"' ]
		ifFalse: [ 'sh -c ''echo biosmalltalk | grep biosmalltalk''' ].
	output := BioGtUnixSubprocess executeCommand: command.
	self assert: (output includesSubstring: 'biosmalltalk')
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandQuotedParameter [
	| output |

	output := BioGtUnixSubprocess
		executeCommand: 'echo'
		parameter: '"bio smalltalk"'.
	self assert: (output includesSubstring: 'bio smalltalk')
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testExecuteCommandStderrOutput [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "echo errormsg 1>&2 & exit /b 1"' ]
		ifFalse: [ 'sh -c ''echo errormsg 1>&2; exit 1''' ].
	output := BioGtUnixSubprocess executeCommand: command.
	self assert: (output includesSubstring: 'errormsg')
]

{ #category : 'tests' }
BioGtUnixSubprocessTest >> testProviderClass [
	self assert: BioGtUnixSubprocess providerClass equals: #GtUnixSubprocess
]
