Class {
	#name : #SFGridPresenterBuilder,
	#superclass : #SFPresenterBuilder,
	#instVars : [
		'rowCount',
		'gridLayout'
	],
	#category : #'Spec-Form'
}

{ #category : #private }
SFGridPresenterBuilder >> appendWidget: aWidget description: aDescription [

		
	rowCount := rowCount + 1.
	gridLayout 
		add: aDescription label 	at: 1@rowCount;
		add: aWidget 				at: 2@rowCount
]

{ #category : #private }
SFGridPresenterBuilder >> read: aDescription [

	^ self memento simpleReneReadUsing: aDescription
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitBooleanDescription: aDescription [ 
	| checkbox |

	checkbox := self newCheckBox
		addStyle: 'mpCheckBox';
		state: (self read: aDescription);
		enabled: aDescription isReadOnly not;
		whenChangedDo: [ :aValue | self write: aValue description: aDescription ];
		help: aDescription comment;
		yourself.
	
	self appendWidget: checkbox description: aDescription
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitContainer: aContainer [
	
	rowCount := 0.
	gridLayout := SpGridLayout new.
	gridLayout beColumnNotHomogeneous.
	gridLayout column: 2 withConstraints: [ :c | c beExpand ].
	
	aContainer children 
		do: [ :each | each acceptSimpleReneVisitor: self ].
		
	presenter layout: gridLayout
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitMemoDescription: aDescription [
	| textArea |

	textArea := self newText
		addStyle: 'mpTextArea';
		text: (self read: aDescription);
		editable: aDescription isReadOnly not;
		whenTextChangedDo: [ :aString | self write: aString description: aDescription ];
		help: aDescription comment;
		yourself.
		 
	self appendWidget: textArea description: aDescription
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitNumberDescription: aDescription [ 
	| numberInput |

	numberInput := self newNumberInput
		addStyle: 'mpNumberInput';
		number: (self read: aDescription);
		editable: aDescription isReadOnly not;
		maximum: aDescription max;
		minimum: aDescription min; 
		whenNumberChangedDo: [ :aNumber | 
			self write: aNumber description: aDescription ];
		help: aDescription comment;
		yourself.
		
	aDescription kind = Float ifTrue: [ 
		numberInput 
			beFloat;
			digits: aDescription digits ].
	
	self appendWidget: numberInput description: aDescription
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitSingleOptionDescription: aDescription [
	| optionList |

	optionList := self newDropList
		items: aDescription options;
		display: [ :anElement | 
			anElement
				ifNotNil: [ aDescription reference toString: anElement ]
				ifNil: [ '' ] ];
		selectItem: (self read: aDescription);
		enabled: aDescription isReadOnly not;
		whenSelectedItemChangedDo: [ :anElement | 
			self write: anElement description: aDescription ];
		yourself.
	
	self 
		appendWidget: optionList 
		description: aDescription
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitStringDescription: aDescription [ 
	| textInput |

	textInput := self newTextInput
		addStyle: 'mpTextInput';
		text: (self read: aDescription);
		editable: aDescription isReadOnly not;
		whenTextChangedDo: [ :aString | self write: aString description: aDescription ];
		help: aDescription comment;
		yourself.
		 
	self appendWidget: textInput description: aDescription
]

{ #category : #visiting }
SFGridPresenterBuilder >> visitUrlDescription: aDescription [ 
	| textInput url |

	url := self read: aDescription.
	textInput := self newLink
		addStyle: 'mpLink';
		url: url; 
		label: (aDescription urlLabel ifNil: [ url ]);
		"whenBuiltDo: [ :ann | 
			GRunLoop defer: [ ann widget hAlignStart ] ];"
		help: aDescription comment;
		yourself.
		 
	self appendWidget: textInput description: aDescription
]

{ #category : #private }
SFGridPresenterBuilder >> write: anObject description: aDescription [

	self memento 
		simpleReneWrite: anObject 
		using: aDescription
]
