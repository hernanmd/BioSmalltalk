examples
example1
	" hmmbuild globins4.hmm tutorial/globins4.sto "
	" hmmsearch globins4.hmm uniprot sprot.fasta > globins4.out "
	
	| samplesDir hmmFile stoFile fastaFile outputFile |

	samplesDir := BioObject testFilesFullDirectoryName.
	hmmFile := (samplesDir / 'globins4.hmm') fullName.
	stoFile :=  (samplesDir / 'globins4.sto') fullName.
	BioHMMERWrapper new
			addParameter: hmmFile;
			addParameter: stoFile;
			runHmmBuild;
			execute.

	fastaFile := (samplesDir / 'globins45.fa') fullName.
	outputFile :=  (samplesDir / 'globins4.out') fullName.
	^ BioHMMERWrapper new
			runHmmSearch;
			addParameter: hmmFile;
			addParameter: fastaFile;
			addOption: 'o' value: outputFile;
			execute.