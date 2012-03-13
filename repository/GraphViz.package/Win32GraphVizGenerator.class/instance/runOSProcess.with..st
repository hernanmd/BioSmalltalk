external
runOSProcess: command with: arguments

	| shell |
	shell := Win32Shell new.
	shell
		shellExecute: nil
		lpOperation: 'open'
		lpFile: command
		lpParameters: arguments
		lpDirectory: self outputPath
		nShowCmd: 0