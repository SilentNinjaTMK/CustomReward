//entity.s.fdForcedReward 用于区分生成函数中是否包含fdForcedReward没有fdForcedReward就使用switch获取这种npc的默认钱数，有就获取特定钱数
//entity.s.fdForcedReward 主要用于FD_ExtraNPCSpawn.gnut中，存在于新NPC的生成函数中
untyped
global function CustomReward_Init

void function CustomReward_Init()
{
	AddCallback_OnNPCKilled(OnNPCKilled)
}

void function OnNPCKilled(entity victim, entity attacker,var damageInfo)
{
	if (!attacker.IsPlayer() || !victim.IsNPC())
		return

	int reward = 0

	if ("fdForcedReward" in victim.s) //使用expect int不得输入传入其他类型的值，否则崩溃
		reward = expect int(victim.s.fdForcedReward)
	else
	{
		string NPC_Type = victim.GetAISettingsName();
		switch (NPC_Type)
		//AISettingsName参考AISetting文件
		{
			case "npc_drone": //电浆无人机
				reward = 5
				break;
			case "npc_soldier": //IMC士兵
				reward = 5
				break;
			case "npc_spectre_mortar": //迫击炮幽灵战士
				reward = 10
				break;
			case "npc_stalker_fd": //潜行者
				reward = 15
				break;
			case "npc_super_spectre_fd": //死神
				reward = 20
				break;
			case "npc_frag_drone_fd": //炸蛛
                reward = 5
				break;
			case "npc_titan_atlas_tracker": //强力
				reward = 50
				break;
			case "npc_titan_stryder_leadwall_arc": //电弧
				reward = 50
				break;
			case "npc_titan_atlas_tracker_mortar": //迫击炮
				reward = 50
				break;
			case "npc_titan_ogre_minigun_nuke": //核爆
				reward = 50
				break;
			case "npc_titan_atlas_vanguard_boss_fd": //帝王
				reward = 50
				break;
			case "npc_titan_atlas_stickybomb_boss_fd": //离子
                reward = 50
				break;
			case "npc_titan_ogre_meteor_boss_fd": //烈焰
				reward = 50
				break;
			case "npc_titan_stryder_leadwall_boss_fd": //浪人
				reward = 200
				break;
			case "npc_titan_stryder_sniper_fd": //北极星
				reward = 50
				break;
			case "npc_titan_stryder_sniper_fd": //北极星
				reward = 50
				break;
			case "npc_titan_atlas_tracker_fd_sniper": //狙击强力
				reward = 50
				break;
			case "npc_titan_ogre_minigun_boss_fd": //军团
				reward = 50
				break;
		}
	}

    if( reward > 0 )
        AddMoneyToPlayer( attacker, reward )
}