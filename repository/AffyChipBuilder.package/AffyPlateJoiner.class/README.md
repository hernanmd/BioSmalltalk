AffyPlateJoiner new
	rootDirectory:  'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\CSVs' ;
	readAllSamples. 

AffyPlateJoiner new
	rootDirectory:  '/usr/local/data/proyectos/microarray_igevet_2016/data/Info_Corridas_Placas(CSVs)' ;
	readAllSamples. 

grep -v -f Exclude_List.txt BOS1_Placas-1_3-transposed.txt > BOS1_Placas-1_3-filter-1.txt

paste BOS1_Placas-1_3-filter-1.txt output.csv > BOS1_Placas-1_3-filter-2.txt

Original Script:

| illuminaAffySNPs illuminaAffyFilename affy640SNPIds affy640Header affyExportFilename rejectedSNPs |

affyExportFilename := 'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\BOS1_Placas-1_3-transposed.txt'.
illuminaAffyFilename := 'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\illuaffy.csv'.

illuminaAffySNPs := illuminaAffyFilename asFileReference readStreamDo: [ : stream |
	(NeoCSVReader on: stream)
		separator: $,;
		skipHeader;
		rowsCollect: [ : record | (record at: 25) asUppercase ] ].
	
affy640SNPIds := affyExportFilename asFileReference readStreamDo: [ : stream | 
	(NeoCSVReader on: stream)
		separator: Character tab;
		readHeader ].

affy640SNPIds doWithIndex: [ : record : index | (illuminaAffySNPs includes: record) ifFalse: [ rejectedSNPs add: index ] ].
self halt.

affy640Header := (NeoCSVReader on: affyExportFilename asFileReference readStream) readHeader.

'c:\Users\mvs\Dropbox\IGEVET\Affymetrix\Pampita\Affy_Illumina_CommonSNPs.csv' asFileReference writeStreamDo: [ : fstream | 	
	ZnBufferedWriteStream on: fstream do: [ :stream |
		(NeoCSVWriter on: stream) 
			fieldWriter: #raw;
			separator: Character tab;
			writeHeader: affy640Header;
			nextPutAll: affy640SNPIds;
			flush ] ].