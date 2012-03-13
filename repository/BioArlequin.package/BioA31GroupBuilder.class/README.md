This group builder accepts as input:

1) A grouping selector symbol named keyString 
2) A BioClassifications object (Dictionary) containing regions elements (Associations) each one as:

key:	<TCountryOrganization>			example: TSpain
value:	<Dictionary of: Dictionary>		example: #(ClassificationDictionary1 ClassificationDictionary2 ... ClassificationDictionaryN)

each Dictionary inside this Dictionary follows this format:

key:	<String>							example: 'ACAGGTACGTAGCATGCA'
value:	<Object | BioClassification>

Then proceeds grouping the ClassificationDictionary(s) in each region by #perform: the keyString selector (which should be responded by each ClassificationDictionary).

Usage:

| grouping arlequinGroups |
grouping 		:= ObjectWithAlignments groupByAlignments.
arlequinGroups := ( BioA31GroupBuilder 
						groupBy: #aSelector 
						classifications: grouping ) groups.

The output is a Collection of <GTA31Group>