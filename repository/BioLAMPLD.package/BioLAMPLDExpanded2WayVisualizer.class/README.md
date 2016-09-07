The expanded output is a full haplotype-like format expanded from the original compact output from LAMP-LD.

The script convertLAMPLDout.pl converts the original LAMP-LD output into the expanded format.

The Data Points matrix is built reading LAMP-LD and assigning rows as follows:

Row 1 = 11 = Color blue 
Row 2 = 01 = Color black 
Row 3 = 00 = Color red

Usage Examples
==============

Open a visualization of an expanded file:

BioLAMPLDExpanded2WayVisualizer 
	openOnFileNamed: 'results\postlampld_ws-50.txt'
	title: 'W = 50'.

Open a visualization in a directory with expanded files :

BioLAMPLDExpanded2WayVisualizer 
	openOnDirectory: 'results'.
