BioAbstractAdapter defines the interface and abstract behavior for Adapters in BioSmalltalk. An adapter is composed of a "provider" which refers to the external class (the adaptee).

Final subclasses are the adapters.

Usage:  To use an adapter interface, one should never refer to the name of the final subclasses (the adapters). Instead refer to the the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

Instead of 

BioFLSerializer ...
BioSIXXSerializer ..

Another example, to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
