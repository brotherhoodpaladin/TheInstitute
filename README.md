# The Institute (TheInstitute.esp)
A mod for improvements to make The Institute a cleaner and more technologically advanced place.

## Mod Changes

### 2.3.2

* Updated _InstituteAutoVendor.psc_ script to include debugging and trace output if Papyrus logging is enabled.
* Fixed the Auto-Mat Vendor in the Director Storage area. I could not determine the source of the bug causing it not to work, so I replaced the instance with a new object. I examined the item along with its replacement in FO4Edit and could not see any differences. However the replacement worked, and the original file was not working. I tried to determine if it might have been an issue with the save since I used FallRimTools to clean it, and was unable to determine if it was the case using saves before and after.

### 2.3.1

* Refactored recycler scripts based on usage due to a bug that was not discovered during initial testing.

### 2.3.0

* Added a Recycler to Advanced Systems to breakdown MiscObject items into components.

### 2.2.1

* Fixed an minor issue with Bobble Head Display Script.

### 2.2.0

* **Added new Bobble Head Display in Director's Quarters.** It will display the bobble heads on shelf when added, and remove them from shelf when removed from container.
* Straightened out Shaun's computer on his desk in Director's Quarters.
* Moved Desk in Director's Quarters bedroom to center between wall panels.
* Changed office cabinet next to bed in Director's Quarters bedroom into a dresser. Set the dresser to not respawn, and "NoResetZone".
* Changed office cabinet in Director's Quarters bedroom to not respawn, and "NoResetZone".
* Added shelves above bed in Director's Quarters.
* Added some additional items to Director's Quarters bedroom to give it a more realistic appearance. The items are scrappable if you want to remove or take them.
* Removed "Unknown" LCTN reference. It was likely a merge of my development mod with the production .esp.

### 2.1.1

* Added Crystal as a requisition item at the request of @VaultNinja
* Added Circuitry and Fiber Optics requisition items.

### 2.1.0

* Changed the Microscope in Quarters to a terminal because it is more useful. I like the replacement since it looks like the previous microscope, but is open.
* Added a holotape storage container to desk. I found I had a lot of holotapes and I didn't want to keep putting them in a dresser.

### 2.0.1
* Removed a master file dependency for an upcoming version.

### 2.0.0
* Added an initial Director's Storage Room located through storage closet next to Institute requisition vendor.
* Added a Vault 111 Storage container to Director's Storage Room.
* **Automat** - Added a new auto-vendor that will allow you to sell items automatically. There is a 25% disposal and recycling fee that is charged. I thought that this would make it more lore-friendly since, as noted on automat, the assets must be liquidated by Institute assets on the surface with local vendors. The automat is located in the Director's Storage Room. The automat will look for a Keyword "Unscrappable" which is assigned to most unique items to prevent them from being sold.

### 1.1.0
* Removed rubble piles on floor in Institute Concourse Molecular Relay area.
* Added requisition holotape in private room on desk. The holotape allows you to requisition specific materials with a default game cost to keep it lore friendly. It provides a materiel requisition that works like a shipment in the vanilla game. This materiel requisition can be added to a work bench to receive the requisitioned item.

### 1.0.0
* Removed leaf piles in Institute Concourse.
* All Institute Sliding Doors are now auto-closable.. The doors close automatically (default: 5 seconds). The doors will automatically lock if set (default: false). Both settings are configurable.
* Added more Institute Bottled Water (10) and Institute Food Packets (25) to Commissary vendor.
* Added additional buff to Institute Food. Restores Health 5 points/sec for 10s instead of 2.5. Wasteland Survival Perk changes it to 10 points/per second for 10s.
* Added unique food item to Commissary called Food Supplement 77.
* Added lore holotapes and technical data for mysterious Food Supplement 77.
* Added a bed in the Director's Quarters. The bed is scrappable. I moved some of the items in the room to accommodate the bed, but did not scrap, disable, or otherwise remove their references. I did this because unless you install other mods with some of the Institute furniture, you can not add an Institute bed without the use of the Creation Kit.
