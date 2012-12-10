private
checkCygwinAvailableUnderWindows

	| cygpath |
	OSHandle currentOS = #win32 ifTrue: [
		cygpath := ExternalProcess defaultClass cshOne: 'cygpath -W'.
		(cygpath startsWith: '/cygdrive') ifFalse: [
			self error: 'The external SVN library requires Cgywin to run under Windows.' ]]