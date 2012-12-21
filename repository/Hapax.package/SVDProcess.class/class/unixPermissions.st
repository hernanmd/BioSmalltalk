private
unixPermissions
	"-- because unices are picky."

	OSPlatform isUnix
		ifTrue: [ (Smalltalk at: #OSProcess) command: ('chmod +x ', self programFilename asString) ]