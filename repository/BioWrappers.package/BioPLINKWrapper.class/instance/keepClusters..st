properties - filtering
keepClusters: fileName  
	" If samples are assigned to clusters (via --within/--family), --keep-clusters and --keep-cluster-names can be used individually or in combination to define a list of clusters to keep; all samples not in one of those clusters are then removed from the current analysis. --keep-clusters accepts a text file with one cluster name per line, and --keep-cluster-names takes a space-delimited sequence of cluster names on the command line. "

	self propertyAt: 'keep-clusters' ifAbsentPut: [ self buildPath: fileName ]