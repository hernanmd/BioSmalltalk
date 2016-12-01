Represents a Microsatellite marker.
A microsatellite is defined by a name, fragment size range (bp), dye color, and repeat length. 

 BioMicrosatellite new 
	name: 'BM1818';
	alleleRangeStart: 266;
	alleleRangeEnd: 270;
	sequence: 'TG';
	yourself.
	
 BioMicrosatellite new 
	name: 'BM1818';
	positions: 266 -> 270;
	yourself.
	
 BioMicrosatellite new 
	name: 'BM1818';
	positions: #(266 270);
	yourself.
	
Internal Representation and Key Implementation Points.

    Instance Variables
	genotype:		<Object>
	motif:		<Object>
	repeatStartPos:		<Object>
	repeats:		<Object>

References 

https://en.wikipedia.org/wiki/Microsatellite
https://en.wikipedia.org/wiki/Sequence_motif
https://tools.thermofisher.com/content/sfs/manuals/cms_042039.pdf

