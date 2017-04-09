Abstract class for visualization of LAMP-LD data. It uses the Roassal visualization engine.
See subclasses for specific implementations depending on the number of parental populations.

In short, the visualizer can read two output file formats :

- The "compact" format output from unolanc, unolanc2way and unolanc5way.
- The "expanded" format output from convertLAMPLDOut.pl Perl script.


    Instance Variables
	data:			<String >
	dataPoints:		<Collection>
	dataSet:			<Collection>
	grapher:			<RTGrapher>

