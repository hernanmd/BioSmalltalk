examples
example02
	" The case for the following example is an output file sent by Illumina 
	and you want to export to HaploView format by chromosome. "

	| inputCol exporter |

	self needsWork.
	inputCol := Dictionary newFromPairs: {
'c-01.csv' . 1673820 .
'c-02.csv' . 1442016 .
'c-03.csv' . 1280844 .
'c-04.csv' . 1259280 .
'c-05.csv' . 1254312 .
'c-06.csv' . 1278684 .
'c-07.csv' . 1194048 .
'c-08.csv' . 1207044 .
'c-09.csv' . 1118160 .
'c-10.csv' . 1096164 .
'c-11.csv' . 1152540 .
'c-12.csv' . 940572 .
'c-13.csv' . 849384 .
'c-14.csv' . 892080 .
'c-15.csv' . 891180 .
'c-16.csv' . 870408 .
'c-17.csv' . 801576 .
'c-18.csv' . 697896 .
'c-19.csv' . 680688 .
'c-20.csv' . 773640 .
'c-21.csv' . 762300 .
'c-22.csv' . 649224 .
'c-23.csv' . 547740 .
'c-24.csv' . 670320 .
'c-25.csv' . 465516 .
'c-26.csv' . 548712 .
'c-27.csv' . 473472 .
'c-28.csv' . 469368 .
'c-29.csv' . 529560 }.
	self halt.
	self 
		folder: 'Data\SNPsEst1y2\'
		newOnInputFiles: inputCol 
		samples: #( 2734 2736 2737 2739 2744 2749 2750 2754 2762 2764 2765 2770 2777 2784 2790 2805 2810 2811 2814 2817 4921 4935 4944 4955 4958 4992 4999 5005 5011 5012 5014 5016 8030 8055 8061 8075)
		affectionStatuses: #(1 2 1 2 2 2 1 2 2 2 1 1 1 2 1 1 1 2 1 2 1 1 2 1 2 2 2 2 1 1 1 2 2 1 1 2).
		