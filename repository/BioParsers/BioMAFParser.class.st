"
GTMAFParser as described in https://cgwb.nci.nih.gov/goldenPath/help/maf.html
This is work in progress

"
Class {
	#name : #BioMAFParser,
	#superclass : #BioAbstractTextParser,
	#category : #'BioParsers-Core'
}

{ #category : #initialization }
BioMAFParser >> initialize [
	" Private - See superimplementor's comment "
	
	self flag: #toDo.
	super initialize.	
	"parser := self mafHeaderParser , self mafBodyParser."

]

{ #category : #'initialize-release' }
BioMAFParser >> mafBodyParser [

	| mafSrc mafStart mafSize mafStrand mafSrcSize mafSeqAlign mafSequence mafAlignParams mafScore mafPass mafAlignBlock mafBody |
	mafSrc := nil.
	mafStart := nil.
	mafSize := nil.
	mafStrand := nil.
	mafSrcSize := nil.
	mafScore := nil.
	mafPass := nil.
	mafSeqAlign := mafSrc , mafStart , mafSize , mafStrand , mafSrcSize , #word asParser.
	mafSequence := $s asParser , #blank asParser , mafSeqAlign , #newline asParser.
	mafAlignParams := $a asParser , #blank asParser , (mafScore optional , mafPass optional , mafScore optional) , #newline asParser.
	mafAlignBlock := mafAlignParams , mafSequence plus , #newline asParser.
	mafBody := mafAlignBlock plus.
	^ mafBody
	

]

{ #category : #'initialize-release' }
BioMAFParser >> mafHeaderParser [

	| mafProgram mafScoringScheme mafScoring mafVersion mafVar mafOptions mafHeader |
	
	mafProgram := 'program' asParser , $= asParser , self parserForNonBreakingString.
	mafScoringScheme := #word asParser.
	mafScoring := 'scoring' asParser , $= asParser , mafScoringScheme.
	mafVersion := 'version' asParser , $= asParser , #number asParser.
	mafVar := mafVersion / mafScoring optional / mafProgram optional / self parserForNonBreakingString.
	mafOptions := mafVar plus max: 3.
	mafHeader := '##maf ' asParser , mafOptions , #newline asParser.
	^ mafHeader

]
