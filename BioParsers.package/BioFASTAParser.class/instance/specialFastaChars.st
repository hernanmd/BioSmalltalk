accessing private
specialFastaChars
	" Answer a Collection with Characters with special
	meaning for the FASTA definition line format "
	
	^ Array 
		with: Character cr 
		with: Character lf
		with: $|