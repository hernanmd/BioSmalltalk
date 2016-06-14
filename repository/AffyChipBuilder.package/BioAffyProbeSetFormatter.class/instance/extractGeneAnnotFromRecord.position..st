report
extractGeneAnnotFromRecord: record position:aNumber

	| geneAnnotString geneAnnotTriplet |

	geneAnnotString := record at: aNumber.	
	geneAnnotTriplet := self extractGeneAnnotFromRecord: geneAnnotString.
	geneAnnotTriplet do: [ : annotSet | 
		annotSet do: [ : annotField | 
			self csvWriter 
				ensureOpen;
				writeField: annotField trimBoth; 
				writeSeparator;
				flush. ] ] .
	self csvWriter writeEndOfLine 
