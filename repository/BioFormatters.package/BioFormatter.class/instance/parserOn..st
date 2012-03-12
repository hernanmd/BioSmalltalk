accessing
parserOn: aString

	^ ( self parserClass on: ( ReadStream on: aString ) )
			parser delimiter: $;;
			ignoreHeaderLine;
			yourself.