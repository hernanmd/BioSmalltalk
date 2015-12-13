A web client implementation targeted for Squeak. See http://www.squeaksource.com/WebClient.html for details.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
