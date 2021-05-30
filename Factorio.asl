/** 
 * Factorio.asl - An ASL script for the auto-splitter of LiveSplit for the game Factorio (x64, steam version, English localization)
 * @author  AureiAnimus and MrHug (inspired by original autosplitter by Ekelbatzen)
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
			{ "none", "Firsts", "Split with firsts", 0x0},
				{ "Firsts", "rocket", "First rocket launch", 0xf5},
				//{ "Firsts", "fBlue", "First blue science made" , 0xf6},

			{ "none", "Research", "Split with research completion:", 0x0},
				{ "Research", "red-sci", "Splits with red science:",0x0 },
					{ "red-sci", "automation", "automation completed" , 0xf4},
					{ "red-sci", "logistics", "logistics completed" , 0x604},
					{ "red-sci", "electronics", "electronics completed", 0x2a4 },
					{ "red-sci", "fast-inserter", "fast-inserter completed", 0x334 },
					{ "red-sci", "steel-processing", "steel-processing completed", 0x1534 },
					{ "red-sci", "steel-axe", "steel-axe completed", 0x16e4 },
					{ "red-sci", "logistic-science", "logistic-science completed", 0x1321 },
				{ "Research", "green-sci", "Splits with green science:" ,0x0},
					{ "green-sci", "automation2", "automation2 completed", 0x184 },
				{ "Research", "blue-sci", "Splits with blue science:" ,0x0},
					{ "blue-sci", "advanced-oil-proc", "advanced-oil-proc completed", 0x30c4 },
				{ "Research", "purple-sci", "Splits with purple science:",0x0},
					{ "purple-sci", "prod-3-module", "prod-3-module completed", 0x6754 },
				{ "Research", "yellow-sci", "Splits with yellow science:",0x0},
					{ "yellow-sci", "rocket-silo", "rocket-silo completed", 0x3345 },

			// { "none", "Buildings", "Split with building numbers:", 0x0},
			// 	{ "Buildings", "Furnace", "Splits with furnaces number",0x3A4 }
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
