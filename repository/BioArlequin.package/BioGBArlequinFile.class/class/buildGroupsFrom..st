instance creation
buildGroupsFrom: aClassifier

	^ (BioGBA31GroupBuilder 
			groupBy: 'GBQualifier_value' 
			classifications: aClassifier groupByAlignment) groups.