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

There are several ways to install **BioSmalltalk**. At minimum, you need a working Pharo virtual image installed in a system. Check the [Pharo website](http://www.pharo.org) for installation information regarding the Pharo Open-Source system. To paste the following expressions inside Pharo, open a "Playground" window with (Cmd + O + I) or by clicking an empty area in the Pharo window and select Tools -> Playground. 

To evaluate a expression, click on the upper right green arrow or highlight the script code and right click for options.

For additional help using Pharo please check the excellent [free Pharo books](http://books.pharo.org/), the [awesome-pharo lists](https://github.com/pharo-open-documentation/awesome-pharo) and the [wiki](https://github.com/pharo-open-documentation/pharo-wiki). 
For a quick reference of the syntax, check the [Pharo Cheat Sheet](http://files.pharo.org/media/pharoCheatSheet.pdf)

## Standard Installation

You can uncomment the specific loading group in the following expression by removing the # prepended character, and add it to the group currently uncommented. Check the installation matrix above to know about the options. The script should be evaluated inside the Pharo image. The current Pharo version 8.x is supported.

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

## Baseline String

If you want to add BioSmalltalk to your Metacello Baselines or Configurations, copy and paste the following expression:


