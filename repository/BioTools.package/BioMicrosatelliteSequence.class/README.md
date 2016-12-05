Represents a Microsatellite marker.  A microsatellite is a tract of repetitive DNA in which certain DNA motifs (ranging in length from 2–5 base pairs) are repeated, typically 5–50 times.

A microsatellite is defined by a name, fragment size range (bp), dye color, and repeat length. 

 BioMicrosatelliteSequence new 
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
	
References 

https://en.wikipedia.org/wiki/Microsatellite
https://en.wikipedia.org/wiki/Sequence_motif
https://tools.thermofisher.com/content/sfs/manuals/cms_042039.pdf

