The expanded output is a full haplotype-like format expanded from the original compact output from LAMP-LD.

The script convertLAMPLDout.pl converts the original LAMP-LD output into the expanded format.

Usage Examples
==============

Open a visualization of an expanded file:

BioLAMPLDExpandedVisualizer 
	openOnFileNamed: 'results\postlampld_ws-50.txt'
	title: 'W = 50'.

Open a visualization in a directory with expanded files :

BioLAMPLDExpandedVisualizer 
	openOnDirectory: 'results'.
