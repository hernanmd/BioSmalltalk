accessing private
specialFastaChars
	" Answer a Collection with Characters with special
	meaning for the FASTA definition line format "
	
	^ { Character cr . 
		Character lf .
		$| }