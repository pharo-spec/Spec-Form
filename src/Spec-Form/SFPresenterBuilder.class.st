Class {
	#name : 'SFPresenterBuilder',
	#superclass : 'SRVisitor',
	#traits : 'SpTPresenterBuilder',
	#classTraits : 'SpTPresenterBuilder classTrait',
	#instVars : [
		'presenter'
	],
	#category : 'Spec-Form',
	#package : 'Spec-Form'
}

{ #category : 'private' }
SFPresenterBuilder >> appendWidget: aWidget description: aDescription [

	self subclassResponsibility
]

{ #category : 'instance creation' }
SFPresenterBuilder >> instantiate: aPresenterClass [
	"Instantiate a SpPresenter subclass and set its instance owner"

	^ aPresenterClass owner: self presenter
]

{ #category : 'instance creation' }
SFPresenterBuilder >> instantiate: aPresenterClass on: aModel [
	"Instantiate a SpPresenter subclass and set its instance owner and model"

	^ aPresenterClass 
		owner: self presenter 
		on: aModel
]

{ #category : 'accessing' }
SFPresenterBuilder >> memento [

	^ self presenter memento
]

{ #category : 'accessing' }
SFPresenterBuilder >> presenter [

	^ presenter
]

{ #category : 'accessing' }
SFPresenterBuilder >> presenter: anObject [

	presenter := anObject
]

{ #category : 'private' }
SFPresenterBuilder >> read: aDescription [

	^ self memento simpleReneReadUsing: aDescription
]

{ #category : 'visiting' }
SFPresenterBuilder >> visitBooleanDescription: aDescription [ 
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

{ #category : 'visiting' }
SFPresenterBuilder >> visitContainer: aContainer [
		
	aContainer children 
		do: [ :each | each acceptSimpleReneVisitor: self ]
]

{ #category : 'visiting' }
SFPresenterBuilder >> visitMemoDescription: aDescription [
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

{ #category : 'visiting' }
SFPresenterBuilder >> visitNumberDescription: aDescription [ 
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

{ #category : 'visiting' }
SFPresenterBuilder >> visitSingleOptionDescription: aDescription [
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

{ #category : 'visiting' }
SFPresenterBuilder >> visitStringDescription: aDescription [ 
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

{ #category : 'visiting' }
SFPresenterBuilder >> visitToOneRelationDescription: aDescription [
	| relationPresenter |

			
	relationPresenter := self 
		instantiate: SFToOnePresenter 
		on: (aDescription -> self memento).
			
	self appendWidget: relationPresenter description: aDescription
]

{ #category : 'visiting' }
SFPresenterBuilder >> visitUrlDescription: aDescription [ 
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

{ #category : 'private' }
SFPresenterBuilder >> write: anObject description: aDescription [

	self memento 
		simpleReneWrite: anObject 
		using: aDescription
]
