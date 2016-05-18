scanning
readAllSamples

	self affySamples 
		add: (self readSamplesA: self rootDirectory / 'CSVs1\IGEVETAX_Sample_Table-FinalSampleTable.csv');
		add: (self readSamplesB: self rootDirectory / 'CSVs2\PlateAFFYM_BOS_I_Entre24Nov22NonBN-Hoja2.csv');
		add: (self readSamplesB: self rootDirectory / 'CSVs3\20150906_Bos1_GT4-PlacaGT4.csv');
		add: (self readSamplesC: self rootDirectory / 'CSVs4\Gir_Indivs.csv');
		yourself.
	self writeSamples: self joinSamples.
	
	