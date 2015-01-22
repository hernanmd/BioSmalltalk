accessing
exportClassifiedRecordsFrom: aPCTProject features: aCollection 

	self
		formatType: 'DNA';
		setCodeTableAsStandard;
		indel: $-;
"		missing: $?;"
		export
				
