# BioSmalltalk

See [BioSmalltalk web site](https://biosmalltalk.github.io/web) for documentation

# Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Implementation notes](#implementation-note)
- [License](#license)

# Description

BioSmalltalk is an Open-Source (MIT-licensed) library for Bioinformatics using Smalltalk (currently [Pharo](http://www.pharo.org)).

# Installation

There are several ways to install the **BioSmalltalk**. At minimum, you need a working Pharo virtual image installed in your system. Check the [Pharo website](http://www.pharo.org) for installation information regarding the Pharo Open-Source system. Once Pharo is launched you have the following installation options:


**Group**|**BioTools**|**BioParsers**|**BioWrappers**|**BioFormatters**|**BioClassifier**|**BioNCBI**|**BioBlast**|**BioEntrez**
-----|-----|-----|-----|-----|-----|-----|-----
All|-|-|-| -| -| -| -|-|
Basic|-|-|-|-|-|-|-|-|
Core|-|-|-|-|-|-|-|-|
Tests|-|-|-|-|-|-|-|-|

To evaluate the following scripts, open a "Playground" window by clicking an empty area in the Pharo window and select Tools -> Playground. To actually evaluate the pasted script, click on the upper right green arrow or highlight the script code and right click for options.

## Basic packages

```smalltalk
Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk/repository';
    load: #('Basic')
```

## Core packages

```smalltalk
Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk/repository';
    load: #('Basic')
```

## Population Genomics packages

```smalltalk
Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk/repository';
    load: #('PopulationGenomics')
```

## Test packages

```smalltalk
Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk/repository';
    load: #('Tests')
```

## All packages version

```smalltalk
Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk/repository';
    load: #('All').
```

## Troubleshoot install

You could try the script below to install BioSmalltalk if you experience one of these exceptions:

  - IceGenericError: Failed to connect to github.com: Interrupted system call.
  - IceGenericError: SecureTransport error: connection closed via error
  - IceGenericError: unexpected return value from ssl handshake -9806


```smalltalk
[ Metacello new
    baseline: 'BioSmalltalk';
    repository: 'github://hernanmd/biosmalltalk/repository';
    onWarningLog;
    load ]
on: IceGenericError 
do: [ : ex | ex retry ]
```

## Baseline String

If you want to add BioSmalltalk to your Metacello Baselines or Configurations, copy and paste the following expression:

        " ... "
        spec
                baseline: 'BioSmalltalk' 
                with: [ spec repository: 'github://hernanmd/BioSmalltalk/repository' ];
        " ... "

If you want to add a BioSmalltalk installation group to your Metacello Baselines or Configurations, copy and paste the following expression, replacing Basic with the group of your interest:

        " ... "
        spec
                baseline: 'BioSmalltalk' 
                with: [ spec load: #('Basic'); repository: 'github://hernanmd/BioSmalltalk/repository' ];
        " ... "

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on Github.
If you'd like to make some changes yourself, see the following:    

  - Fork this repository to your own GitHub account and then clone it to your local device
  - Do some modifications
  - Test.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

# License

This software is licensed under the MIT License.

Copyright Hernán Morales, 2019.

Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to 
the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
