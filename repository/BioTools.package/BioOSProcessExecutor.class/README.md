OSProcess provides access to operating system functions, including pipes and child process creation. It is implemented using pluggable primitives in a shared library for Unix or Linux, and a DLL for Windows. The Smalltalk code, including the classes which implement pluggable primitives for Unix or Win32 operating system functions, may be loaded into any Squeak image, but the primitives are only useful on Unix and Windows systems

See http://wiki.squeak.org/squeak/708 for details
