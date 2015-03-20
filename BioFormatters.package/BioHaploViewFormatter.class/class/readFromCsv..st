instance creation
readFromCsv: csvFilename
	" The case for the following example is an output file sent by Illumina and you want to export to HaploView format by chromosome. 
	
	BioHaploViewFormatter readFromCsv: ''
	"

	| inputCol |

	inputCol := Dictionary newFromPairs: { csvFilename . (self linesCount: csvFilename) }.
	self 
		folder: String empty
		newOnInputFiles: inputCol 
		samples: #()"#( 2734 2736 2737 2739 2744 2749 2750 2754 2762 2764 2765 2770 2777 2784 2790 2805 2810 2811 2814 2817 4921 4935 4944 4955 4958 4992 4999 5005 5011 5012 5014 5016 8030 8055 8061 8075)"
		affectionStatuses: #() "#(1 2 1 2 2 2 1 2 2 2 1 1 1 2 1 1 1 2 1 2 1 1 2 1 2 2 2 2 1 1 1 2 2 1 1 2)."
		