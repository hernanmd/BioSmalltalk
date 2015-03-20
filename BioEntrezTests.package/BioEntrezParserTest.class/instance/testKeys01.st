accessing
testKeys01

	| keys |
	
	keys := BioParser tokenizeNcbiXmlEntrezResultKeys: self eResults01.
	self assert: ( keys bioHasEqualElements:  #('eSearchResult' 'Count' 'RetMax' 'RetStart' 'QueryKey' 'WebEnv' 'IdList' 'Id' 'TranslationSet' 'QueryTranslation') )