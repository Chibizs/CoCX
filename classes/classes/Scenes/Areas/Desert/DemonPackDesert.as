﻿package classes.Scenes.Areas.Desert
{
import classes.*;
import classes.GlobalFlags.kFLAGS;
import classes.internals.WeightedDrop;

public class DemonPackDesert extends Monster
	{


		override protected function performCombatAction():void
		{
			//Demon pack has different AI
			if (rand(2) == 0)
				special1();
			else special2();
		}

		override public function defeated(hpVictory:Boolean):void
		{
			if (hpVictory) {
				outputText("You strike out and the last of the demons tumbles to the ground with a thud. You stand there for a second surrounded by dead or unconscious demons feeling like a god of battle. Then you realize that if a god of battle does exist he lives on a demonic plane like this, so to avoid insulting him you take your hands off your hips and your [legs] off the head of the demon leader before you start to search the bodies.", true);
				player.dynStats("lus", 1);
			} else {
				outputText("The demons stop attacking, and reach out to touch your body. Some are already masturbating like it's the only thing in the world and you know that right now, if you wanted to, you could make each and every one of them fuck you.");
			}
			if(hasStatusEffect(StatusEffects.phyllafight)) {
				doNext(game.desert.antsScene.consolePhylla);
			} else if (hpVictory || flags[kFLAGS.SFW_MODE] > 0){
				game.cleanupAfterCombat();
			} else {
				outputText("  Do you rape them?", true);
				game.doYesNo(rapeDemons, game.cleanupAfterCombat);
			}
		}

		private function rapeDemons():void{
			outputText("You open your arms and step into the throng of eager demons. They jump eagerly to touch you, becoming more and more lust-frenzied every second. You take the nearest demon and throw it to the ground and without a moment's thought the rest of the group leap to join you in a thoughtless madness of lust...", true);
			doNext(game.desert.oasis.oasisSexing);
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (player.gender == 0){
				if (hpVictory) {
					outputText("You collapse before the demons, who laugh at your utter lack of male or female endowments, beating you until you pass out.", true);
				} else {
					outputText("You offer yourself to the demons, who promptly begin laughing at your lack of endowments.  They fall on you as one, beating you into unconsciousness.", true);
				}
				game.cleanupAfterCombat();
			} else if (flags[kFLAGS.SFW_MODE] > 0) {
				outputText("Because SFW mode is enabled, this scene is disabled.");
				game.cleanupAfterCombat();
			} else if (hpVictory){
				outputText("The demons finally beat you down and you collapse onto the sand of the oasis. Almost immediately you feel demonic hands pressing and probing your prone form. You hear the leader of the group say something in a strange tongue but you have a feeling you know what it means. The demons dive onto your inert body with intent and begin to press themselves against you...", true);
				doNext(game.desert.oasis.oasisSexing);
			} else {
				outputText("You struggle to keep your mind on the fight and fail to do so. ", true);
				if (pcCameWorms){
					outputText("\n\nThe demons joke and smile, obviously unconcerned with your state.\n\n");
				}
				if(player.cocks.length > 0) {
					if(player.cockTotal() > 1) outputText("Each of y");
					else outputText("Y");
					outputText("our [cocks] throbs ");
					if(player.hasVagina()) outputText(" and your ");
				}
				if(player.vaginas.length > 0) {
					if(!player.hasCock()) outputText("Your ");
					outputText(game.vaginaDescript(0) + " burns ");
				}
				outputText("with arousal.  You make a grab for the nearest demon and catch a handful of jiggly breast. You try desperately to use your other arm to pull her closer to slake your thirst but you both go tumbling to the ground. The demonic leader laughs out loud and the rest of the tribe falls on you, grabbing for anything it can find.");
				doNext(game.desert.oasis.oasisSexing);
			}
		}


		override public function teased(lustDelta:Number):void
		{
			outputText("\n");
			if(lustDelta == 0) outputText("\n" + capitalA + short + " seems unimpressed.");
			else if(lustDelta > 0 && lustDelta < 5) outputText("The demons lessen somewhat in the intensity of their attack, and some even eye up your assets as they strike at you.");
			else if(lustDelta >= 5 && lustDelta < 10) outputText("The demons are obviously steering clear from damaging anything you might use to fuck and they're starting to leave their hands on you just a little longer after each blow. Some are starting to cop quick feels with their other hands and you can smell the demonic lust of a dozen bodies on the air.");
			else if(lustDelta >= 10) outputText("The demons are less and less willing to hit you and more and more willing to just stroke their hands sensuously over you. The smell of demonic lust is thick on the air and part of the group just stands there stroking themselves openly.");
			applyTease(lustDelta);
		}

		public function DemonPackDesert()
		{
			trace("DemonPack Constructor!");
			this.a = "the ";
			this.short = "demons";
			this.imageName = "demonmob";
			this.long= "The group is composed of roughly twenty tan-skinned demons, mostly humanoid in shape with many and varied corruptions across the mob. You see demonic high heels, twisting horns and swinging cocks of all shapes and sizes. There even seems to be a bull head in there somewhere. You also make out plenty of breasts ranging from tiny ones to a pair that requires a second person to carry them, and with those breasts a wide range of pussies, dripping and dry, sometimes nestled below some form of demonic dick.  The small tribe carries no weapons and what little clothing they wear is well-shredded, except for one hefty male wearing a cloak of what appears to be snakeskin across his broad shoulders." + (game.silly() ? "  You spot an odd patch that reads, \"<i>41st Engineer Company: Vaginal Clearance</i>\" on his shoulder." : "");
			this.plural = true;
			this.pronoun1 = "they";
			this.pronoun2 = "them";
			this.pronoun3 = "their";
			this.createCock(18,2);
			this.createCock(18,2,CockTypesEnum.DEMON);
			this.balls = 2;
			this.ballSize = 1;
			this.cumMultiplier = 3;
			// this.hoursSinceCum = 0;
			this.createVagina(false, AppearanceDefs.VAGINA_WETNESS_SLICK, AppearanceDefs.VAGINA_LOOSENESS_LOOSE);
			createBreastRow(0);
			this.ass.analLooseness = AppearanceDefs.ANAL_LOOSENESS_STRETCHED;
			this.ass.analWetness = AppearanceDefs.ANAL_WETNESS_SLIME_DROOLING;
			this.tallness = rand(8) + 70;
			this.hipRating = AppearanceDefs.HIP_RATING_AMPLE+2;
			this.buttRating = AppearanceDefs.BUTT_RATING_LARGE;
			this.skinTone = "red";
			this.hairColor = "black";
			this.hairLength = 15;
			initStrTouSpeInte(50, 30, 10, 5);
			initLibSensCor(50, 70, 100);
			this.weaponName = "claws";
			this.weaponVerb="claw";
			this.weaponAttack = 5 + (2 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
			this.armorName = "demonic skin";
			this.armorDef = 5 + (1 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
			this.bonusHP = 20;
			this.bonusLust = 200;
			this.lust = 30;
			this.temperment = TEMPERMENT_LOVE_GRAPPLES;
			this.level = 9;
			this.gems = rand(30)+20;
			this.drop = new WeightedDrop().addMany(1,
							consumables.SUCMILK,
							consumables.INCUBID,
							consumables.OVIELIX,
							consumables.B__BOOK);
			this.special1 = game.combat.packAttack;
			this.special2 = game.combat.lustAttack;
			this.tailType = AppearanceDefs.TAIL_TYPE_DEMONIC;
			this.hornType = AppearanceDefs.HORNS_DEMON;
			this.horns = 2;
			this.createPerk(PerkLib.EnemyGroupType, 0, 0, 0, 0);
			this.str += 10 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL];
			this.tou += 6 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL];
			this.spe += 2 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL];
			this.inte += 1 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL];			
			this.lib += 10 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL];
			this.newgamebonusHP = 290;
			checkMonster();
		}

	}

}
