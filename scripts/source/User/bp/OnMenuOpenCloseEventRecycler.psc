ScriptName bp:OnMenuOpenCloseEventRecycler extends bp:Recycle Const hidden
{ This script implements the bp:Recycle script for a container that has OnMenuOpenCloseEvent events. }

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnInit()
	; Before we can use OnMenuOpenCloseEvent we must register it.
	RegisterForMenuOpenCloseEvent("ContainerMenu")
	AddInventoryEventFilter(CA_JunkItems)
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	; Debug.Notification("OnMenuOpenCloseEvent called.")
	If (asMenuName== "ContainerMenu")
		If (!abOpening)
			Recycle()
		EndIf
	EndIf
EndEvent
