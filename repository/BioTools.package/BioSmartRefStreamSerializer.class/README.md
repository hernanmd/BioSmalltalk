BioSmartRefStreamSerializer is an adapter for the "classic" generic object serializer for Squeak.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet