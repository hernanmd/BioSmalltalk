initialize-release
mafBodyParser

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
	
