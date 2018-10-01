ScriptName bp:OnItemAddedEventRecycler extends bp:Recycle Const hidden
{ This script implements the bp:Recycle script for a container that has OnItemAdded events. }

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
  ; Debug.Notification("OnItemAdded Event called.")
  Self.RemoveItem(akBaseItem, aiItemCount, True, pRecyclerTemporaryContainerRef)
  AutoRecycle(pRecyclerComponents,pRecyclerScrap, pRecyclerTemporaryContainerRef)
  If(pRecyclerStorageContainerRef != None)
    pRecyclerTemporaryContainerRef.RemoveAllItems(pRecyclerStorageContainerRef as ObjectReference, False)
  Else
    pRecyclerTemporaryContainerRef.RemoveAllItems(Game.getPlayer() as ObjectReference, False)
  EndIf
EndEvent
