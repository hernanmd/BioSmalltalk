initialize-release
mafHeaderParser

	| mafProgram mafScoringScheme mafScoring mafVersion mafVar mafOptions mafHeader |
	
	mafProgram := 'program' asParser , $= asParser , self parserForNonBreakingString.
	mafScoringScheme := #word asParser.
	mafScoring := 'scoring' asParser , $= asParser , mafScoringScheme.
	mafVersion := 'version' asParser , $= asParser , #number asParser.
	mafVar := mafVersion / mafScoring optional / mafProgram optional / self parserForNonBreakingString.
	mafOptions := mafVar plus max: 3.
	mafHeader := '##maf ' asParser , mafOptions , #newline asParser.
	^ mafHeader
