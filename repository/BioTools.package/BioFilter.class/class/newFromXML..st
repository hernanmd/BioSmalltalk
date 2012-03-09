instance creation
newFromXML: aFileLocation

	^ self newFromReader: ( 
		self reader
			results: ( self openFileNamed: aFileLocation );
			yourself )