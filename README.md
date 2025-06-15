[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/hernanmd/BioSmalltalk.svg?branch=master)](https://travis-ci.org/hernanmd/BioSmalltalk)
[![Coverage Status](https://coveralls.io/repos/github/hernanmd/BioSmalltalk/badge.svg?branch=master)](https://coveralls.io/github/hernanmd/BioSmalltalk?branch=master)

# Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

# Description

BioSmalltalk is an Open-Source (MIT-licensed) library for Bioinformatics using Smalltalk (currently [Pharo](http://www.pharo.org)).

# Installation

There are several ways to install **BioSmalltalk**. At minimum, you need a working Pharo virtual image installed in a system. Check the [Pharo website](http://www.pharo.org) for installation information regarding the Pharo Open-Source system. You can also two use one-liners: `bash -c "$(curl -fsSL https://raw.githubusercontent.com/hernanmd/pi/master/install.sh)"` to install PI (Pharo Install CLI) and `pi lrun` to install the latest Pharo image. To paste the following expressions inside Pharo, open a "Playground" window with (Cmd + O + I) or by clicking an empty area in the Pharo window and select Tools -> Playground. 

To evaluate a expression, click on the upper right green arrow or highlight the script code and right click for options.

For additional help using Pharo please check the [free Pharo books](http://books.pharo.org/), the [awesome-pharo lists](https://github.com/pharo-open-documentation/awesome-pharo) and the [wiki](https://github.com/pharo-open-documentation/pharo-wiki). 
For a quick reference of the syntax, check the [Pharo Cheat Sheet](http://files.pharo.org/media/pharoCheatSheet.pdf)

## Standard Installation

The script should be evaluated inside the Pharo image. The current Pharo version 13.x is supported.

```smalltalk
	EpMonitor disableDuring: [
		Metacello new
			onConflictUseLoaded;
			onWarningLog;
			repository: 'github://hernanmd/biosmalltalk/repository';
			baseline: 'BioSmalltalk';
			load ].
```
In case of problems check [Troubleshoot Install](./TROUBLESHOOT.md)

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on Github.
If you have any suggestions for how this package could be improved, please get in touch or suggest an improvement using the GitHub issues page.
If you'd like to make some changes yourself, see the following:    

  - Fork this repository to your own GitHub account and then clone it to your local device
  - Do some modifications
  - Test.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# License
	
This software is licensed under the MIT License.

Copyright Hernán Morales Durand, 2025.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Authors

Hernán Morales Durand

