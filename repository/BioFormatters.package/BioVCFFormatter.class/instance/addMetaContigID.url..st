accessing - meta - contig
addMetaContigID: contigStringID url: urlString
	" As with chromosomal sequences it is highly recommended (but not required) that the header include tags describing the contigs referred to in the VCF le. This furthermore allows these contigs to come from different files. The format is identical to that of a reference sequence, but with an additional URL tag to indicate where that sequence can be found. "

	self stream
		nextPutAll: '##contig=<';
		nextPutAll: contigStringID;
		nextPutAll: ',URL=';
		nextPutAll: urlString;
		nextPut: $>;
		bioCr
		