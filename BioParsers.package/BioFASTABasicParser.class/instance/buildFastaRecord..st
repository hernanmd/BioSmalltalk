accessing private
buildFastaRecord: aCollection

	^ BioFastaRecord 
		named: aCollection first
		sequence: ( self seqFrom: aCollection last ) 