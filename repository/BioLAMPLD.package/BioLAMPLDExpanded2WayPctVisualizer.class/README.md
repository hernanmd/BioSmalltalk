LAMP-LD visualizer draws a graph displaying allele frequency percentages in the Y-axis. 
It takes as input : 

- A directory with files in "Expanded LAMP-LD" format.
- A String title 

Row 1 = 11 = Color blue = Brahman 
Row 2 = 01 = Color black 
Row 3 = 00 = Color red = Angus

Usage Examples
==============

BioLAMPLDExpanded2WayPctVisualizer new 
	population1Name: 'Brahman' 	color: Color blue;
	population2Name: 'Angus'	color: Color red;
	name: '% Angus vs. % Brangus - Window Size = 100';
	initialize: 'c:\MHC\Distrib\LAMP-LD\LAMP-LD_workflow_4\postlampld_ws-100.txt';
	open;
	yourself.

	
Open a visualization in a directory with expanded files :

BioLAMPLDExpanded2WayPctVisualizer dumpOnDirectory: '2way-results-expanded'.

BioLAMPLDExpanded2WayPctVisualizer 
	openStackedOnDirectory: 'newResults4' 
	
