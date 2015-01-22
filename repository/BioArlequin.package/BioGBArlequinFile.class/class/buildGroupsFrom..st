instance creation
buildGroupsFrom: aClassifier

	^ (BioGBA31GroupBuilder 
			groupBy: 'breed' 
			classifications: aClassifier groupByAlignment) groups.