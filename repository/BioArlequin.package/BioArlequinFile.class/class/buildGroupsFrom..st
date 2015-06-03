instance creation
buildGroupsFrom: aClassifier

	^ (BioA31GroupBuilder newFromClassifications: aClassifier groupByPaddedAlignment) groups.