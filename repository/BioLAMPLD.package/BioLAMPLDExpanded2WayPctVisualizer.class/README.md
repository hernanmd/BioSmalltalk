LAMP-LD visualizer draws a graph displaying allele frequency percentages in the Y-axis. 
It takes as input : 

- A directory with files in "Expanded LAMP-LD" format.
- A String title 

Usage Examples
==============

BioLAMPLDExpanded2WayPctVisualizer 
	openOnFileNamed: '2way-results-expanded\postlampld_ws-50.txt' 
	title: '% Angus vs. % Brangus - Window Size = 50'.
	
Open a visualization in a directory with expanded files :

BioLAMPLDExpanded2WayPctVisualizer dumpOnDirectory: '2way-results-expanded'.