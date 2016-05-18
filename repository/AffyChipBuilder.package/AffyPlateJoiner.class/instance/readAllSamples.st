scanning
readAllSamples

	self affySamples 
		add: (self readSamplesA: self rootDirectory / 'IGEVETAX_Sample_Table-FinalSampleTable.csv');
		add: (self readSamplesB: self rootDirectory / 'PlateAFFYM_BOS_I_Entre24Nov22NonBN-Hoja2.csv');
		add: (self readSamplesB: self rootDirectory / '20150906_Bos1_GT4-PlacaGT4.csv');
		add: (self readSamplesC: self rootDirectory / 'Gir_Indivs.csv');
		yourself.
	self writeSamples: self joinSamples.
	
	