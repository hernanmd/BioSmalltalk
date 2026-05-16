"
I am a wrapper for MultiQC, a tool for aggregating bioinformatics analysis results across many samples into a single report.

MultiQC scans a directory for analysis logs and compiles a summary HTML report. It supports 100+ bioinformatics tools including FastQC, cutadapt, STAR, Hisat2, BWA, Bowtie, Picard, GATK, samtools, and many more.

Usage:
| wrapper |
wrapper := BioMultiQCWrapper new.
wrapper analysisDirectory: '/path/to/results'.
wrapper outdir: './multiqc_report'.
wrapper title: 'My Analysis Report'.
wrapper execute.

With module selection:
wrapper := BioMultiQCWrapper new.
wrapper module: 'cutadapt'.
wrapper module: 'fastqc'.
wrapper analysisDirectory: '/path/to/results'.
wrapper force.
wrapper execute.

Citation: Philip Ewels et al. MultiQC: summarize analysis results for multiple tools and samples in a single report. Bioinformatics 32(19):3047-3048, 2016.
"
Class {
	#name : 'BioMultiQCWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioNGS-QC',
	#package : 'BioNGS',
	#tag : 'QC'
}

{ #category : 'accessing' }
BioMultiQCWrapper class >> defaultProgramName [
	" Answer a <String> with the default program name "
	^ 'multiqc'
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> ai [
	" Generate an AI summary of the report "

	^ self addOption: 'ai'
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> aiCustomContextWindow: anInteger [
	" Custom context window for OpenAI API (default: 128000) "

	^ self
		  propertyAt: 'ai-custom-context-window'
		  ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> aiCustomEndpoint: aString [
	" Custom AI endpoint to use with OpenAI API "

	^ self propertyAt: 'ai-custom-endpoint' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> aiModel: aString [
	" Select AI model to use for report summarization "

	^ self propertyAt: 'ai-model' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> aiProvider: aString [
	" Select AI provider: seqera, openai, anthropic, aws_bedrock, or custom "

	^ self propertyAt: 'ai-provider' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> aiSummaryFull [
	" Generate a detailed AI summary of the report "

	^ self addOption: 'ai-summary-full'
]

{ #category : 'accessing' }
BioMultiQCWrapper >> analysisDirectory: aPath [
	" Set the analysis directory path to scan (positional argument) "

	^ self addParameter: aPath
]

{ #category : 'accessing - private' }
BioMultiQCWrapper >> buildOptions: stream [
	" Private - Append receiver's options to stream with -- prefix "

	self options ifNil: [ ^ self ].
	self options do: [ :optString |
			stream space.
			optString size = 1
				ifTrue: [
						stream
							nextPut: $-;
							nextPutAll: optString ]
				ifFalse: [
						stream
							nextPutAll: '--';
							nextPutAll: optString ] ]
]

{ #category : 'accessing - private' }
BioMultiQCWrapper >> buildProperties: stream [
	" Private - Append receiver's properties to stream in MultiQC format.
	Single-char flags use -X VALUE with space.
	Multi-char flags use --flag=VALUE with equals. "

	self properties ifNil: [ ^ self ].
	self properties associationsDo: [ :assoc |
			stream space.
			assoc key size = 1
				ifTrue: [
						stream
							nextPut: $-;
							nextPutAll: assoc key;
							space;
							nextPutAll: assoc value asString ]
				ifFalse: [
						stream
							nextPutAll: '--';
							nextPutAll: assoc key;
							nextPut: $=;
							nextPutAll: assoc value asString ] ]
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> checkConfig [
	" Check a MultiQC configuration file for errors and exit "

	^ self addOption: 'check-config'
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> clConfig: aString [
	" Specify MultiQC config YAML on the command line "

	^ self propertyAt: 'cl-config' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-report' }
BioMultiQCWrapper >> comment: aString [
	" Custom comment printed at the top of the report (-b) "

	^ self propertyAt: 'b' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> configFile: aPath [
	" Specific config file to load (-c) "

	^ self propertyAt: 'c' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing-report' }
BioMultiQCWrapper >> customCssFile: aPath [
	" Custom CSS file to add to the final report "

	^ self propertyAt: 'custom-css-file' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> dataDir [
	" Force the parsed data directory to be created "

	^ self addOption: 'data-dir'
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> dataFormat: aString [
	" Output parsed data in a different format: tsv, csv, json, or yaml (-k) "

	^ self propertyAt: 'k' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> development [
	" Development mode. Do not inline JS and CSS, export uncompressed plot data "

	^ self addOption: 'development'
]

{ #category : 'accessing-samples' }
BioMultiQCWrapper >> dirs [
	" Prepend directory to sample names (-d) "

	^ self addOption: 'd'
]

{ #category : 'accessing-samples' }
BioMultiQCWrapper >> dirsDepth: anInteger [
	" Prepend n directories to sample names. Negative to take from start of path (-dd) "

	^ self propertyAt: 'dd' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-modules' }
BioMultiQCWrapper >> exclude: aModuleName [
	" Exclude this module. Can specify multiple times (-e MODULE_NAME). Each call adds one exclude specification. "

	self
		addParameter: '-e';
		addParameter: aModuleName
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> export [
	" Export plots as static images in addition to the report (-p) "

	^ self addOption: 'p'
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> fileList: aPath [
	" Supply a file containing a list of file paths to be searched, one per row (-l) "

	^ self propertyAt: 'l' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing' }
BioMultiQCWrapper >> filename: aString [
	" Set the report filename. Use 'stdout' to print to standard out (-n) "

	^ self propertyAt: 'n' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> flat [
	" Use only flat plots/static images (-fp) "

	^ self addOption: 'flat'
]

{ #category : 'accessing-samples' }
BioMultiQCWrapper >> fnAsSName [
	" Use the log filename as the sample name "

	^ self addOption: 'fn_as_s_name'
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> force [
	" Overwrite any existing reports (-f) "

	^ self addOption: 'f'
]

{ #category : 'accessing-samples' }
BioMultiQCWrapper >> fullnames [
	" Do not clean the sample names, leave as full file name (-s) "

	^ self addOption: 's'
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> ignore: aGlobPattern [
	" Ignore analysis files matching the glob pattern (-x) "

	^ self propertyAt: 'x' ifAbsentPut: [ aGlobPattern ]
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> ignoreSamples: aGlobPattern [
	" Ignore sample names matching the glob pattern "

	^ self propertyAt: 'ignore-samples' ifAbsentPut: [ aGlobPattern ]
]

{ #category : 'accessing-options' }
BioMultiQCWrapper >> ignoreSymlinks [
	" Ignore symlinked directories and files "

	^ self addOption: 'ignore-symlinks'
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> interactive [
	" Use only interactive plots/in-browser Javascript (-ip) "

	^ self addOption: 'interactive'
]

{ #category : 'private' }
BioMultiQCWrapper >> isDoubleDashProperties [
	" Answer <true> - MultiQC uses double-dash flags "

	^ true
]

{ #category : 'accessing-modules' }
BioMultiQCWrapper >> module: aModuleName [
	" Use only this module. Can specify multiple times (-m MODULE_NAME). Each call adds one module specification. "

	self
		addParameter: '-m';
		addParameter: aModuleName
]

{ #category : 'accessing-ai' }
BioMultiQCWrapper >> noAi [
	" Disable AI toolbox and buttons in the report "

	^ self addOption: 'no-ai'
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> noAnsi [
	" Disable coloured log output "

	^ self addOption: 'no-ansi'
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> noDataDir [
	" Do not create the parsed data directory "

	^ self addOption: 'no-data-dir'
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> noMegaqcUpload [
	" Don't upload generated report to MegaQC "

	^ self addOption: 'no-megaqc-upload'
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> noReport [
	" Do not generate a report, only export data and plots "

	^ self addOption: 'no-report'
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> noVersionCheck [
	" Disable checking the latest MultiQC version on the server "

	^ self addOption: 'no-version-check'
]

{ #category : 'accessing-samples' }
BioMultiQCWrapper >> onlySamples: aGlobPattern [
	" Only include sample names matching the given glob expression "

	^ self propertyAt: 'only-samples' ifAbsentPut: [ aGlobPattern ]
]

{ #category : 'accessing' }
BioMultiQCWrapper >> outdir: aPath [
	" Set the output directory for the report (-o) "

	^ self propertyAt: 'o' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> pdf [
	" Create PDF report with the simple template. Requires Pandoc. "

	^ self addOption: 'pdf'
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> profileMemory [
	" Add analysis of how much memory each module uses "

	^ self addOption: 'profile-memory'
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> profileRuntime [
	" Add analysis of how long MultiQC takes to run to the report "

	^ self addOption: 'profile-runtime'
]

{ #category : 'accessing properties' }
BioMultiQCWrapper >> propertyAt: keyName ifAbsentPut: aBlock [
	" Store property. Single-char keys use space separator, multi-char keys use = separator "

	keyName size = 1 ifTrue: [ self propertySeparator: Character space ].
	^ super propertyAt: keyName ifAbsentPut: aBlock
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> quiet [
	" Only show log warnings (-q) "

	^ self addOption: 'q'
]

{ #category : 'accessing-samples' }
BioMultiQCWrapper >> replaceNames: aPath [
	" TSV file to rename sample names during report generation "

	^ self propertyAt: 'replace-names' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing-modules' }
BioMultiQCWrapper >> requireLogs [
	" Require all explicitly requested modules to have log files. Exit with error if not found. "

	^ self addOption: 'require-logs'
]

{ #category : 'accessing-report' }
BioMultiQCWrapper >> sampleFilters: aPath [
	" TSV file containing show/hide patterns for the report "

	^ self propertyAt: 'sample-filters' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing-report' }
BioMultiQCWrapper >> sampleNames: aPath [
	" TSV file containing alternative sample names for renaming buttons "

	^ self propertyAt: 'sample-names' ifAbsentPut: [ aPath ]
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> strict [
	" Don't catch exceptions, run additional code checks to help development "

	^ self addOption: 'strict'
]

{ #category : 'accessing-report' }
BioMultiQCWrapper >> template: aString [
	" Report template to use. One of: default, disco, gathered, geo, original, sections, simple (-t) "

	^ self propertyAt: 't' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-report' }
BioMultiQCWrapper >> title: aString [
	" Set the report title (-i). Printed as page header and used for filename if not otherwise specified. "

	^ self propertyAt: 'i' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-behaviour' }
BioMultiQCWrapper >> verbose: anInteger [
	" Increase output verbosity (-v). Integer range. "

	^ self propertyAt: 'v' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-output' }
BioMultiQCWrapper >> zipDataDir [
	" Compress the data directory (-z) "

	^ self addOption: 'z'
]
