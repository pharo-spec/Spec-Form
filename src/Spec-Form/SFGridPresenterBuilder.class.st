Class {
	#name : 'SFGridPresenterBuilder',
	#superclass : 'SFPresenterBuilder',
	#instVars : [
		'gridLayout',
		'builder'
	],
	#category : 'Spec-Form',
	#package : 'Spec-Form'
}

{ #category : 'private' }
SFGridPresenterBuilder >> appendWidget: aWidget description: aDescription [
		
	builder 
		add: aDescription label;
		add: aWidget;
		nextRow
]

{ #category : 'visiting' }
SFGridPresenterBuilder >> visitContainer: aContainer [

	gridLayout := SpGridLayout new.
	gridLayout beColumnNotHomogeneous.
	gridLayout column: 2 withConstraints: [ :c | c beExpand ].
	
	builder := SpGridLayoutBuilder on: gridLayout.

	super visitContainer: aContainer.

	presenter layout: gridLayout
]
