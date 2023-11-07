Class {
	#name : 'SFToOnePresenter',
	#superclass : 'SpPresenter',
	#traits : 'SpTModel',
	#classTraits : 'SpTModel classTrait',
	#instVars : [
		'label',
		'editButton'
	],
	#category : 'Spec-Form-Presenter',
	#package : 'Spec-Form',
	#tag : 'Presenter'
}

{ #category : 'layout' }
SFToOnePresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: label;
		add: editButton expand: false;
		yourself
]

{ #category : 'private' }
SFToOnePresenter >> description [

	^ self model key
]

{ #category : 'actions' }
SFToOnePresenter >> doEdit [
	| dialog |

	dialog := self value asFormPresenter
		application: self application;
		openModalWithParent: self window.

	dialog isOk ifTrue: [
		self updatePresenter ]
]

{ #category : 'initialization' }
SFToOnePresenter >> initializePresenters [

	label := self newLabel.
	editButton := self newButton
		addStyle: 'flat';
		addStyle: 'small';
		icon: (self iconNamed: 'add');
		action: [ self doEdit ];
		yourself.
]

{ #category : 'private' }
SFToOnePresenter >> memento [

	^ self model value
]

{ #category : 'initialization' }
SFToOnePresenter >> updatePresenter [

	self model ifNil: [ ^ self ].

	label label: (self value simpleReneReadUsing: self description reference)
]

{ #category : 'private' }
SFToOnePresenter >> value [
	
	^ self memento simpleReneReadUsing: self description
]

{ #category : 'private' }
SFToOnePresenter >> value: anObject [
	
	^ self memento 
		simpleReneWrite: anObject 
		using: self description
]
