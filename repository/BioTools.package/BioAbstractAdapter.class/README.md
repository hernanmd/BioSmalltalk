BioAbstractAdapter defines the interface and abstract behavior for Adapters in BioSmalltalk.

Providers refers to the external classes which are adaptee.
Adapters refers to the final subclasses acting as adapters.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use

BioSerializationEngine serialize: anObject.

to get the contents at an URL

( BioWebClientEngine for: 'http://www.google.com.ar' ) httpGet
