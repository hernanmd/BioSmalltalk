BioSmalltalk is an open source library for doing bioinformatics with Smalltalk. BioSmalltalk enables you to build bioinformatics scripts and applications using the most powerful object technology as of today, the Smalltalk programming environment.

This class is used to install the BioSmalltalk library to your environment. It uses the MetacelloFileDownload package to download resource files: https://github.com/hernanmd/MetacelloFileDownload

You can begin installation by evaluating:

Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk';
    load.

Alternatively, if your installation fails, you may try the older installation method. However it could be outdated and some packages could fail:

Metacello new 
	smalltalkhubUser: 'hernan' project: 'BioSmalltalk';
	configuration: 'BioSmalltalk';
	version: #bleedingEdge;
	load.