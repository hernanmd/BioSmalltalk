The case for the following example is an output file sent by Illumina and you want to export to HaploView format by Chromosome.

| inputCol exporter |

inputCol := Dictionary newFromPairs: {
	'resultChromo09.txt' . 621200 .
	'resultChromo10.txt' . 608980 .
	'resultChromo11.txt' . 640300 .
	'resultChromo12.txt' . 522540 .
	'resultChromo13.txt' . 471880 .		
	'resultChromo14.txt' . 495600 .
	'resultChromo15.txt' . 495100 .
	'resultChromo16.txt' . 483560 .
	'resultChromo17.txt' . 445320 . 		
	'resultChromo18.txt' . 387720 .
	'resultChromo19.txt' . 378160 .
	'resultChromo20.txt' . 429800 .
	'resultChromo21.txt' . 423500 .		
	'resultChromo22.txt' . 360680 .
	'resultChromo23.txt' . 304300 .
	'resultChromo24.txt' . 372400 .
	'resultChromo25.txt' . 258620 .	
	'resultChromo26.txt' . 304840 .
	'resultChromo27.txt' . 263040 .
	'resultChromo28.txt' . 260760 .
	'resultChromo29.txt' . 294200 }.

BioHaploViewFormatter
	folder: 'c:\Desarrollo\IlluminaDB\'
	newOnInputFiles: inputCol 
	samples: #( 2734 2736 2737 2739 2744 2749 2750 2754 2762 2764 2765 2770 2777 2784 2790 2805 2810 2811 2814 2817 )
	affectionStatuses: #(1 2 1 2 2 2 1 2 2 2 1 1 1 2 1 1 1 2 1 2).