ScriptName bp:Requisition extends ScriptObject
{This script is used to requisition items.}

;-- Properties --------------------------------------
MiscObject Property caps001 Auto Const Mandatory
{The reference for caps in the game. }
MiscObject Property akRequistionedObject Auto Const Mandatory
{The reference to the object to requisition.}
Actor Property akActor Auto Const Mandatory
{The actor (player) who is making the requisition.}
Message Property akMessage Auto Mandatory
{The message to display when the user can not complete the requisition.}


;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Function requisition (Actor akActor, MiscObject akRequistionedObject, MiscObject akCaps)
  int caps = akActor.getItemCount(akCaps)
  int cost = akRequistionedObject.getGoldValue()
  If (caps >= cost )
    akActor.additem(akRequistionedObject, 1)
    akActor.removeItem(akCaps, cost)
  ElseIf (caps < cost)
    akMessage.show()
  EndIf
EndFunction
