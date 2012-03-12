GTGBSeqCSVFormatter toma los resultados de Entrez GBSeq y escribe en un CSV, por ejemplo en el siguiente flujo de trabajo:

| readers formatter blastReader search flt1 flt2 flt3 flt4 |

blastReader := GTBlastReader newFromXML: 'YUCNM7RA014-Alignment.xml'.
blastReader filter 
	definitionsBeginWith: #('Bos taurus');
	alignsMin: 235;
	alignsThresholdDiff: 5;
	percentMinIdentityOverAlignment: 94.
blastReader contents select: [: node | node hspHSeq ].

readers := GTGBSeqCollection newFromXMLDirectory: 'Data\GBSeqs01\'.
readers parseDocuments.
formatter := GTFileFormatter formatterFor: 'GBSeqReport'.
formatter 
	exportFrom: readers 
	interval: ( 16023 to: 16262 ).