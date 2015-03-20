BioOSInterfaceEngine provides access to OS information like virtual machine system attributes, version information, platform names and subtype names. To access an engine use:

BioOSInterfaceEngine adapter.

Depending on your execution environment, you could have different implementation:

-Pharo currently uses "OSPlatform"
-Squeak uses "OSProcess"

