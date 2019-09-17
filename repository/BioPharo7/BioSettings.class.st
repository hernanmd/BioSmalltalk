"
I describe the customization points of the classes in the BioSmalltalk package, so that the Settings framework might collect them and populate a setting browser with them.

To open a setting browser on the settings available for the Boids package, evaluate:

(SettingBrowser forKeywords: #('bioPharoSettings')) open.

"
Class {
	#name : #BioSettings,
	#superclass : #Object,
	#classVars : [
		'FileExistsBehavior'
	],
	#category : #'BioPharo7-Settings'
}
