accessing
testKeys02

	| keys |
	
	keys := BioParser tokenizeNcbiXmlEntrezResultKeys: self eResults02.
	self assert: ( keys bioHasEqualElements:  #('TranslationSet' 'TermSet' 'Term' 'From' 'QueryKey' 'Id' 'Explode' 'RetMax' 'IdList' 'WebEnv' 'To' 'TranslationStack' 'Field' 'Translation' 'RetStart' 'eSearchResult' 'OP' 'Count' 'QueryTranslation') )