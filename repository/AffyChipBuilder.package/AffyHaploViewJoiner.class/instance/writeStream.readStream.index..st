accessing
writeStream: str readStream: stream index: index

	| csvWriter |
	csvWriter := (NeoCSVWriter on: (ZnBufferedWriteStream on: str))
					separator: Character tab;
					writeHeader: #('Well' 'Start_Pos' 'End_Pos' 'rs' 'HWpval') , famNamesAB;
					fieldWriter: #raw;
					yourself.
	(NeoCSVReader on: stream)
		separator: Character tab;
		rowsCollect: [ :record | self writeRecord: record on: str csvWriter: csvWriter ].
	csvWriter flush

