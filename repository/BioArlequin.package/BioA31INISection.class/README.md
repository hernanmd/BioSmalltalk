Abstract class for a INI file section corresponding to the Arlequin 3.1 input file format

#configurationAt:		Support for getting default values and validate properties.
						Each time a setting is read, this message is sent to get the default value.
						Each time a setting is written, this meesage is sent to check if the value corresponding
						that setting is valid with its specification found in the class side.

Send #configurationAt: to obtain the specification at that setting
Send #at:				to obtain the value at that setting

#sectionSpecs			Specifications for validate settings