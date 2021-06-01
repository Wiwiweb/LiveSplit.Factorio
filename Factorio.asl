/** 
 * Factorio.asl - An ASL script for the auto-splitter of LiveSplit for the game Factorio (x64, steam version, English localization)
 * @author  AureiAnimus and MrHug (inspired by original autosplitter by Ekelbatzen)
 * @additionnalAuthor Tignass
 * @version 1.1 on May 1st 2021 
 */
state("Factorio", "1.1.33.58442-steam") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C21B00, 0x68;
	ulong	researchArea: 0x1C21B00, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	// ulong	buildingNumberArea:	0x1C21B00, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30;
	byte	gamePaused:   0x1C21B00, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1C21B00, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.30.58304-steam") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C1AAE0, 0x68;
	ulong	researchArea: 0x1C1AAE0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	// ulong	buildingNumberArea:	0x1C1AAE0, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30;
	byte	gamePaused:   0x1C1AAE0, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1c1aae0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.32.58364-steam") {
	//Check whether we are in a game and start of the research table.
	ulong 	gamePointer : 0x1c199e0, 0x68;
	ulong	researchArea: 0x1c199e0, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	// ulong	buildingNumberArea:	0x1c199e0, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30;
	byte	gamePaused:   0x1c199e0, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1c199e0, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.30-standalone") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C1FD40, 0x68;
	ulong	researchArea: 0x1C1FD40, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	// ulong	buildingNumberArea:	0x1C1FD40, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30;
	byte	gamePaused:   0x1C1FD40, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1C1FD40, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}

state("Factorio", "1.1.34-gog") {
	//Check whether we are in a game and whether or not the game is paused"
	ulong 	gamePointer : 0x1C21B00, 0x68;
	ulong	researchArea: 0x1C21B00, 0x68, 0x68, 0x2C8, 0x70, 0x8, 0x0;
	ulong	buildingNumberArea:	0x1C21B00, 0x68, 0x68, 0x2C8, 0xE0, 0x28, 0x30;
	byte	gamePaused:   0x1C21B00, 0x68, 0x68, 0x270;
	byte 	numRockets: 0x1C21B00, 0x68, 0x68, 0x2A8, 0x0, 0x5d8;
}
init{
	if (modules.First().ModuleMemorySize == 30756864)
        version = "1.1.30.58304-steam";
  	else if (modules.First().ModuleMemorySize == 30777344)
        version = "1.1.30-standalone";
	else if (modules.First().ModuleMemorySize == 30752768)
        version = "1.1.32.58364-steam";
	else if (modules.First().ModuleMemorySize == 30765056)
        version = "1.1.33.58442-steam";
	else if (modules.First().ModuleMemorySize == 30785536)
        version = "1.1.34-gog";
	else
		print("No known version MemorySize " + modules.First().ModuleMemorySize);
}	

startup {
	print("startup");
	
	// object structure (Parent, Id, Description, Pointer)
	Object [,] Settings =
		{
					{ "none", "Research", "Split with research completion:", 0x0},
				{ "Research", "red-sci", "Splits with red science:",0x0 },
					{ "red-sci", "automation", "automation completed" , 0xf4},
					{ "red-sci", "logistics", "logistics completed" , 0x604},
					{ "red-sci", "electronics", "electronics completed", 0x2a4 },
					{ "red-sci", "fast-inserter", "fast-inserter completed", 0x334 },
					{ "red-sci", "steel-processing", "steel-processing completed", 0x1534 },
					{ "red-sci", "steel-axe", "steel-axe completed", 0x16e4 },
					{ "red-sci", "logistic-science-pack", "logistic-science-pack completed", 0x1321 },
				{ "Research", "green-sci", "Splits with green science:" ,0x0},
					{ "green-sci", "automation2", "automation2 completed", 0x184 },
					{ "green-sci", "advanced-material-processing", "advanced-material-processing completed", 0x1654 },
					{ "green-sci", "engine", "engine completed", 0xBA4 },
					{ "green-sci", "fluid-handling", "fluid-handling completed", 0x3034 },
					{ "green-sci", "oil-processing", "oil-processing completed", 0x2FA4 },
					{ "green-sci", "plastics", " completed", 0x3274 },
					{ "green-sci", "advanced-electronics", "advanced-electronics completed", 0x3C4 },
					{ "green-sci", "sulfur-processing", "sulfur-processing completed", 0x31E4 },
					{ "green-sci", "chemical-science-pack", "chemical-science-pack completed", 0x1264 },
					{ "green-sci", "battery", "battery completed", 0xD54 },
					{ "green-sci", "modules", "modules completed", 0x63F4 },
					{ "green-sci", "productivity-module", "productivity-module completed", 0x6634 },
					{ "green-sci", "logistics-2", "logistics-2 completed", 0x694 },
					{ "green-sci", "railway", "railway completed", 0x1A44 },
					{ "green-sci", "speed-module", "speed-module completed", 0x6484 },
					{ "green-sci", "advanced-oil-processing", "advanced-oil-processing completed", 0x30c4 },
					{ "green-sci", "lubricant", "lubricant completed", 0xCC4 },
					{ "green-sci", "electric-engine", "electric-engine completed", 0xC34 },
					{ "green-sci", "robotics", "robotics completed", 0x1C84 },
					{ "green-sci", "advanced-electronics-2", "advanced-electronics-2 completed", 0x454 },
					{ "green-sci", "advanced-material-processing-2", "advanced-material-processing-2 completed", 0x1774 },
					{ "green-sci", "toolbelt", "toolbelt completed", 0x2734 },
					{ "green-sci", "research-speed-1", "research-speed-1 completed", 0x27C4 },
					{ "green-sci", "research-speed-2", "research-speed-2 completed", 0x2854 },
					{ "green-sci", "flammables", "flammables completed", 0x3814 },
					{ "green-sci", "concrete", "concrete completed", 0x1804 },
				{ "Research", "blue-sci", "Splits with blue science:" ,0x0},
					{ "blue-sci", "construction-robotics", "construction-robotics completed", 0x1D14 },
					{ "blue-sci", "worker-robots-speed-1", "worker-robots-speed-1 completed", 0x1FE4 },
					{ "blue-sci", "worker-robots-speed-2", "worker-robots-speed-2 completed", 0x2074 },
					{ "blue-sci", "production-science-pack", "production-science-pack completed", 0x1414 },
					{ "blue-sci", "low-density-structure", "low-density-structure completed", 0x6A24 },
					{ "blue-sci", "utility-science-pack", "utility-science-pack completed", 0x15C4 },
					{ "blue-sci", "rocket-fuel", "rocket-fuel completed", 0x6B44 },
					{ "blue-sci", "productivity-module-2", "productivity-module-2 completed", 0x66C4 },
					{ "blue-sci", "speed-module-2", "speed-module-2 completed", 0x6514 },
				{ "Research", "purple-sci", "Splits with purple science:",0x0},
					{ "purple-sci", "productivity-module-3", "productivity-module-3 completed", 0x6754 },
					{ "purple-sci", "speed-module-3", "speed-module-3 completed", 0x65A4 },
					{ "purple-sci", "effect-transmission", "effect-transmission completed", 0x6994 },
					{ "purple-sci", "research-speed-3", "research-speed-3 completed", 0x28E4 },
				{ "Research", "yellow-sci", "Splits with yellow science:",0x0},
					{ "yellow-sci", "rocket-control-unit", "rocket-control-unit completed", 0x6AB4 },
					{ "yellow-sci", "rocket-silo", "rocket-silo completed", 0x3345 },

			
			{ "none", "Buildings", "Split with building numbers:", 0x0},
				{ "Buildings", "BurnerCity", "Splits when BurnerCity is done",0x1 },
					{ "BurnerCity", "stone-furnace#5", "stone-furnace#5", 0x3A4 },
					{ "BurnerCity", "burner-mining-drill#5", "burner-mining-drill#5", 0xF4 },
				{ "Buildings", "BurnerCity2", "Splits when BurnerCity2 is done",0x1 },
					{ "BurnerCity2", "stone-furnace#6", "stone-furnace#6", 0x3A4 },
					{ "BurnerCity2", "burner-mining-drill#6", "burner-mining-drill#6", 0xF4 },
				{ "Buildings", "Power", "Splits when Power is done",0x1 },
					{ "Power", "boiler#1", "boiler#1", 0xE8 },
					{ "Power", "steam-engine#1", "steam-engine#1", 0x394 },
					{ "Power", "lab#1", "lab#1", 0x25C }
		};

	// create a variable of the array lenght
	vars.ArrayLength = Settings.GetLength(0);
	
	//create a new dictionnary
	vars.split = new Dictionary<string, Dictionary<string, ulong>>();
	for (int i = 0; i < vars.ArrayLength; ++i)
	{

		string parent 		= Settings[i, 0].ToString();
		string id    		= Settings[i, 1].ToString();
		string description  = Settings[i, 2].ToString();
		ulong address		= Convert.ToUInt64(Settings[i, 3]);

		//add parents entry in layout selection
		if (parent=="none"){
			settings.Add(id, false, description);
		}else{
			settings.Add(id, false, description, parent);
		}
		//create variables usable in "split section"
		if (address==Convert.ToUInt64(0x0)){
			if (!vars.split.ContainsKey(id)){
				vars.split[id] = new Dictionary<string, ulong>();
			}
		}else{
			vars.split[parent][id] = address;
		}
	}

	// create a variable to handle "already done splits"
	vars.splitsDone = new HashSet<string>();

}

start {
	if (current.gamePointer != 0&& old.gamePointer == 0) {
		vars.splitsDone = new HashSet<string>();
		return true;
	}
	return false;
}

split {
	if (settings["rocket"] && !vars.splitsDone.Contains("rocket")) {
		if (current.numRockets == 1 && old.numRockets == 0) { 
			vars.splitsDone.Add("rocket");
			return true;
		}
	}
	
	
	if (settings["Research"]) {
		foreach(var id in vars.split.Keys){
			if (!settings[id]) continue;
				foreach(KeyValuePair<string, ulong> entry in vars.split[id]) {
					if (settings[entry.Key] && !vars.splitsDone.Contains(entry.Key)) { // We want to split on it and it hasn't happened yet.
						if (memory.ReadValue<byte>((System.IntPtr)(current.researchArea + entry.Value)) == 1) {
							vars.splitsDone.Add(entry.Key);
							// print(entry.Key.ToString());
							return true;
						}
					}
				}

		}
	}
	if (settings["Buildings"]){
			if (!settings[id]) continue;
				foreach(KeyValuePair<string, ulong> entry in vars.split[id]) {
					// print(entry.Key.parent.ToString());
					if(entry.Key.Contains("#")){
						string[] subString= entry.Key.Split('#');
						ulong numBuilding= Convert.ToUInt64(subString[1]);
						if(entry.Key.Contains("#"+numBuilding)){
							if (settings[entry.Key] && !vars.splitsDone.Contains(entry.Key)) { // We want to split on it and it hasn't happened yet.
								if (memory.ReadValue<byte>((System.IntPtr)(current.buildingNumberArea + entry.Value)) == numBuilding) {
									vars.splitsDone.Add(entry.Key);
									// print(entry.Key.ToString());
									return true;
								}
							}
						}
					}
				}
		}

	///////////////////////////////////////////////
	////////////////////Debug//////////////////////
	///////////////////////////////////////////////

	//print the number of rockets launched
	//print("numRockets: "+current.numRockets.ToString());

	// print 1 if automation research is done
	// print("research automation: "+memory.ReadValue<byte>((System.IntPtr)(current.researchArea + vars.split["red-sci"]["automation"])).ToString());

	//print the number of furnaces
	// print("number of furnaces: "+memory.ReadValue<byte>((System.IntPtr)(current.buildingNumberArea + 0x3A4)).ToString());

	return false;
}

isLoading {
	return current.gamePaused == 1;
}

shutdown {
	vars.splitsDone = new HashSet<string>();
}
reset {
	if(memory.ReadValue<byte>((System.IntPtr)(current.gamePointer)) == 0){
		return true;
	}
}
