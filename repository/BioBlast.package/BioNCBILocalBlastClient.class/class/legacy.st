instance creation
legacy
	" Answer a new instance of the receiver's latest legacy version "
	
	^ ( ( self allSubclasses 
				select: [: cls | cls isLegacyVersion ] )
					detectMax: [: cls | cls versionNumber ] ) new