Wrapper for ZINC HTTP Components. Zinc HTTP Components is an open-source Smalltalk framework to deal with the HTTP networking protocol. Pharo is our reference platform. Zn is reasonably mature and complete. It has been in development and in production use since 2010 and is a standard part for Pharo versions 1.3, 1.4, 2.0 and 3.0. 

See http://zn.stfx.eu/zn/index.html for details

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
