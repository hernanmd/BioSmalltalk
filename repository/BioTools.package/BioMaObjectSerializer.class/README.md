Adapter for the Magma Object Database

See http://wiki.squeak.org/squeak/2665 for details

Currently Magma is available in Squeak and Pharo.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet