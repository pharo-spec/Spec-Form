Class {
	#name : 'SFToManyPresenter',
	#superclass : 'SpPresenter',
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'label',
		'list',
		'addButton'
	],
	#category : 'Spec-Form-Presenter',
	#package : 'Spec-Form',
	#tag : 'Presenter'
}

{ #category : 'layout' }
SFToManyPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: list;
		add: (SpBoxLayout newTopToBottom
				add: addButton expand: false;
				yourself) 
			expand: false;
		yourself
]

{ #category : 'private' }
SFToManyPresenter >> description [

	^ self model key
]

{ #category : 'private' }
SFToManyPresenter >> displayFor: anObject [

	^ anObject simpleReneReadUsing: self description reference
]

{ #category : 'actions' }
SFToManyPresenter >> doAdd [
	| dialog object |

	object := self description classes first new.
	dialog := object asFormPresenter
		application: self application;
		openModalWithParent: self window.
	dialog isOk ifFalse: [ ^ self ].
	
	self halt.
	self updatePresenter
]

{ #category : 'initialization' }
SFToManyPresenter >> initializePresenters [

	list := self newEasyListView.
	list display: [ :each | self displayFor: each ].

	addButton := self newButton
		addStyle: 'flat';
		addStyle: 'small';
		icon: (self iconNamed: 'add');
		action: [ self doAdd ];
		yourself.
]

{ #category : 'private' }
SFToManyPresenter >> memento [

	^ self model value
]

{ #category : 'initialization' }
SFToManyPresenter >> updatePresenter [

	self model ifNil: [ ^ self ].
	list items: self value
]

{ #category : 'private' }
SFToManyPresenter >> value [
	
	^ self memento simpleReneReadUsing: self description
]

{ #category : 'private' }
SFToManyPresenter >> value: anObject [
	
	^ self memento 
		simpleReneWrite: anObject 
		using: self description
]
