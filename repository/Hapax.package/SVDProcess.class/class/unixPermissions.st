private
unixPermissions
	"-- because unices are picky."

	OSHandle currentOS = #unix
		ifTrue: [ UnixProcess cshOne: ('chmod +x ', self programFilename asString) ]