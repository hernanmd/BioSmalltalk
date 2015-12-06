ProcessWrapper is a plugin + wrapper code for Win32 process execution with non-blocking stdin, stdout and stderr support. 

The project aims to give features similar to OSProcess, but it's not related to it in any other way.

Most programs should be located in a standard directory and be reachable by the PATH variable.
If programName <String> is NOT in the PATH variable, then  #which: will not be able to locate the complete path to the program,