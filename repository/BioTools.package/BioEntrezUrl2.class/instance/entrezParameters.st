accessing
entrezParameters
	" Private - Answer a Collection with Strings representing valid Entrez parameters "
	
	^ ((BioEntrezCommand withAllSubclasses collect: #validParameters) 
				joinUsing: Array empty) asSet