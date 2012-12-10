instance creation
fromFolder: filename select: aBlock

	| corpus tdm |
	corpus := HXEnglishCorpus new.
	filename asFilename allFilesDo: [ :file |
		(aBlock value: file) ifTrue: [
			corpus addFile: file ]].
	corpus removeStopwords.
	corpus stemAll.

	tdm := TermDocumentMatrix empty.
	tdm addVocabulary: corpus.
	tdm removeHapaxes.
	tdm weight.

	^self with: tdm