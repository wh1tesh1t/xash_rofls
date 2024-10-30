cstrike_running()
{
	new mod_name[32];
	get_modname(mod_name, 31);
	new var1;
	return equal(mod_name, "cstrike", MaxClients) || equal(mod_name, "czero", MaxClients) || equal(mod_name, "csv15", MaxClients) || equal(mod_name, "cs13", MaxClients);
}

public plugin_init()
{
	register_plugin("[BK] Spectator Bot", "1.2", "AntiBash");
	set_task(1086324736, "bot_make", 170, 400, MaxClients, 404, MaxClients);
	return 0;
}

public bot_make()
{
	bot_create("Dolbaeb3d - Bot");
	bot_create("by AntiBash");
	return 0;
}

public bot_create(name[])
{
	new BotName[32];
	BotC = BotC + 1;
	formatex(BotName, 31, "%s", name);
	BotID[BotC] = engfunc(53, BotName);
	server_print("Bot successful added: %s", name);
	if (0 < BotID[BotC])
	{
		dllfunc(29, "player", BotID[BotC]);
		set_pev(BotID[BotC], 84, 8192);
		set_pev(BotID[BotC], 3, 832);
		set_pev(BotID[BotC], 144, 836);
		set_pev(BotID[BotC], 66, 0);
		set_pev(BotID[BotC], 78, 0);
		set_pev(BotID[BotC], 77, 4);
		set_pev(BotID[BotC], 40, 0);
		bot_team(BotID[BotC]);
		set_user_flags(BotID[BotC], 1, MaxClients);
	}
	else
	{
		log_amx("[BK BOT] Error bot's can't creating!");
	}
	return 0;
}

public bot_remove(BotClient)
{
	server_cmd("kick #%d", get_user_userid(BotClient));
	BotID[BotClient] = 0;
	return 0;
}

public bot_team(BotClient)
{
	if (cstrike_running())
	{
		cs_set_user_team(BotClient, MaxClients, MaxClients, 1);
	}
	return 0;
}