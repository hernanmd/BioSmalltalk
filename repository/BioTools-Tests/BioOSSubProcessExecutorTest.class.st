"
Tests for BioOSSubProcessExecutor execution behavior.
"
Class {
	#name : 'BioOSSubProcessExecutorTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Adapters',
	#package : 'BioTools-Tests',
	#tag : 'Adapters'
}

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandChained [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "echo bio&&echo smalltalk"' ]
		ifFalse: [ 'sh -c ''echo bio; echo smalltalk''' ].
	output := BioOSSubProcessExecutor executeCommand: command.
	self assert: (output includesSubstring: 'bio').
	self assert: (output includesSubstring: 'smalltalk')
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandEcho [
	| output |

	output := BioOSSubProcessExecutor executeCommand: 'echo biosmalltalk'.
	self assert: (output includesSubstring: 'biosmalltalk')
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandFailureReturnsErrorOutput [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "nonexistent_command_12345"' ]
		ifFalse: [ 'sh -c ''nonexistent_command_12345''' ].
	output := BioOSSubProcessExecutor executeCommand: command.
	self deny: output isEmpty
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandParameter [
	| output |

	output := BioOSSubProcessExecutor
		executeCommand: 'echo'
		parameter: 'biosmalltalk'.
	self assert: (output includesSubstring: 'biosmalltalk')
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandPipeline [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "echo biosmalltalk | findstr /c:biosmalltalk"' ]
		ifFalse: [ 'sh -c ''echo biosmalltalk | grep biosmalltalk''' ].
	output := BioOSSubProcessExecutor executeCommand: command.
	self assert: (output includesSubstring: 'biosmalltalk')
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandQuotedParameter [
	| output |

	output := BioOSSubProcessExecutor
		executeCommand: 'echo'
		parameter: '"bio smalltalk"'.
	self assert: (output includesSubstring: 'bio smalltalk')
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testExecuteCommandStderrOutput [
	| command output |

	command := Smalltalk os isWindows
		ifTrue: [ 'cmd /c "echo errormsg 1>&2 & exit /b 1"' ]
		ifFalse: [ 'sh -c ''echo errormsg 1>&2; exit 1''' ].
	output := BioOSSubProcessExecutor executeCommand: command.
	self assert: (output includesSubstring: 'errormsg')
]

{ #category : 'tests' }
BioOSSubProcessExecutorTest >> testProviderClass [
	self assert: BioOSSubProcessExecutor providerClass equals: #OSSUnixSubprocess
]
