Scriptname bp:RobotModelDisplayContainer extends ObjectReference Const
{This script activates and de-activates linked static Robot Models when added or removed from the container.}

;-- Properties --------------------------------------
Keyword Property RobotModelKeyword Auto Const

Group StaticRobotModels
  MiscObject Property pRobotModel_A Auto Const
  MiscObject Property pRobotModel_B Auto Const
  MiscObject Property pRobotModel_C Auto Const
  MiscObject Property pRobotModel_Eyebot Auto Const
  MiscObject Property pRobotModel_Gutsy Auto Const
  MiscObject Property pRobotModel_Protectron Auto Const
  MiscObject Property pRobotModel_SentryBot Auto Const
EndGroup


;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnInit()
  Debug.Trace("Initialized Robot Model Display Container.")
  AddInventoryEventFilter(RobotModelKeyword)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

EndEvent
