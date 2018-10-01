ScriptName bp:OnCloseEventRecycler extends bp:Recycle Const hidden
{ This script implements the bp:Recycle script for a container that has OnClose events using auto-recycling. }

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnClose(ObjectReference akActionRef)
  ; Debug.Notification("OnClose Event called.")
  if(akActionRef == Game.GetPlayer())
    Recycle()
  EndIf
EndEvent
