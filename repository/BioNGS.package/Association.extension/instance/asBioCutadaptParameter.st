*BioNGS
asBioCutadaptParameter
	" Answer the receiver suitable for use as Cutadapt parameter "

	^ self key asString , ',' , self value asString