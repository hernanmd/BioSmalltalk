examples
example2
	" Check with binarized PLINK input files "

	BioShapeIt2Wrapper new
		inputBinarized: 'filter_Brangus';
		outputMax: 'brangus';
		thread: 8;
		execute