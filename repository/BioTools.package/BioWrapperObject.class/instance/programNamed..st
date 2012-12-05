private
programNamed: programName
	" Answer a String with the full path to the receiver's binary "
	"( self locator userBinaries / ( self execNameFor: programName ) ) resolve"

	^ BioExecutionEngine which: ( self execNameFor: programName )
