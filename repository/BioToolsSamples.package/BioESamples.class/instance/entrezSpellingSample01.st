eUtilities-spelling
entrezSpellingSample01
	" Outputs an XML with spelling suggestions for the query term String "
	
	| result |
	
	result := 
		BioEntrezClient new pmc 
			term: 'fiberblast cell grwth';
			spell.
	result dumpToFileNamed: 'eSpell1.xml'

