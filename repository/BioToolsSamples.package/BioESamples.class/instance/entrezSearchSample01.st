eUtilities-search
entrezSearchSample01
	" self new entrezClientSample02 "

	| result |
	
	result := BioEntrezClient new nuccore
				term: 'Opuntia AND rpl16';
				search.
	result outputToFile: 'searchNuccore1.xml'
