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
	mafSeqAlign := mafSrc , mafStart , mafSize , mafStrand , mafSrcSize , #word asPParser.
	mafSequence := $s asPParser , #blank asPParser , mafSeqAlign , #newline asPParser.
	mafAlignParams := $a asPParser , #blank asPParser , (mafScore optional , mafPass optional , mafScore optional) , #newline asPParser.
	mafAlignBlock := mafAlignParams , mafSequence plus , #newline asPParser.
	mafBody := mafAlignBlock plus.
	^ mafBody
	

]

{ #category : #'initialize-release' }
BioMAFParser >> mafHeaderParser [

	| mafProgram mafScoringScheme mafScoring mafVersion mafVar mafOptions mafHeader |
	
	mafProgram := 'program' asPParser , $= asPParser , self parserForNonBreakingString.
	mafScoringScheme := #word asPParser.
	mafScoring := 'scoring' asPParser , $= asPParser , mafScoringScheme.
	mafVersion := 'version' asPParser , $= asPParser , #number asPParser.
	mafVar := mafVersion / mafScoring optional / mafProgram optional / self parserForNonBreakingString.
	mafOptions := mafVar plus max: 3.
	mafHeader := '##maf ' asPParser , mafOptions , #newline asPParser.
	^ mafHeader

]
