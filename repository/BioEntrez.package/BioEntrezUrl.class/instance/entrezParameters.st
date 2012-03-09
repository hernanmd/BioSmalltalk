private
entrezParameters
	" Private - Answer a Collection with Strings representing
	valid Entrez parameters "
	
	^ ( ( BioEntrezCommand withAllSubclasses 
			collect: [ : cls | cls validParameters ] ) 
				joinUsing: Array empty ) asSet