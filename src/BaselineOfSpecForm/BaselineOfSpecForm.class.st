Class {
	#name : #BaselineOfSpecForm,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpecForm
}

{ #category : #baselines }
BaselineOfSpecForm >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		self simpleRene: spec.
		spec package: 'Spec-Form' with: [ 
			spec requires: #('SimpleRene') ] ]
]

{ #category : #'external projects' }
BaselineOfSpecForm >> simpleRene: spec [
	
	spec 
		baseline: 'SimpleRene' 
		with: [ spec repository: 'github://pharo-contributions/SimpleRene/src' ]
]
