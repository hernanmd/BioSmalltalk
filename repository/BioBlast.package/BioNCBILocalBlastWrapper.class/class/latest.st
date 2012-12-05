instance creation
latest
	" Answer a new instance of the receiver's latest version "
	
	^ ( self allSubclasses detect: [: cls | cls isLatestVersion ] ) new