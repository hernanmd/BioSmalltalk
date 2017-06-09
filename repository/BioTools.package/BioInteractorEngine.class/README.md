BioInteractorEngine abstracts different types of dispatchers for UI requests. 

To access an engine use:

BioInteractorEngine adapter.

Depending on your execution environment, you could have different implementations:

-Pharo currently uses "UIManager" or one of its subclasses.
-Squeak uses "OSProcess"