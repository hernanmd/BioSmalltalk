private
setUnixPermissions

	OSHandle currentOS = #unix
		ifTrue: [ UnixProcess cshOne: ('chmod +x ', self programFilename asString) ]