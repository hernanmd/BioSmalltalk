Adapter for the Fuel serializer.

See http://rmod.lille.inria.fr/web/pier/software/Fuel for details

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
