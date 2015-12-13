SIXX is Smalltalk Instance eXchange in XML

See URL for details: http://www.mars.dti.ne.jp/~umejava/smalltalk/sixx/

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet