/**
 * ...
 * @author Ormael
 */
package classes.Items.Weapons
{
import classes.ItemType;
import classes.Items.Weapon;
import classes.Items.WeaponLib;
import classes.PerkLib;
	import classes.Player;
	import classes.GlobalFlags.kFLAGS;
	//import classes.Scenes.NPCs.AetherTwinsFollowers;
	import classes.StatusEffects;
	
	public class AetherD extends Weapon {
		
		public function AetherD()
		{
			super("AetherD", "AetherD", "Aether (Dex)", "an Aether (Dex)", "punch", 0, 0, "Aether - dexter part of mysterious sentient weapons pair rumored to be forged by the god of blacksmiths.", "", "Gauntlet");
		}
		
		override public function get description():String {
			var desc:String = _description;
			//Type
			desc += "\n\nType: Weapon (Gauntlet)";
			//Attack
			desc += "\nAttack: " + String(attack);
			//Value
			desc += "\nBase value: 0";
			return desc;
		}
		/*
		override public function get verb():String {
			if (AetherTwinsFollowers.AetherTwinsShape == "insert shape name") return "?";
			else return "punch";
		}
		*/
		override public function get attack():Number {
			var boost:int = 0;
			boost += game.player.statusEffectv1(StatusEffects.AetherTwins1);
			return (0 + boost);
		}
		
		override public function useText():void {
			outputText("\n\n\"<i>Well alright then, [name]!</i>\" Aether (Dex) says excitedly, \"<i>Let's go!</i>\"\n\n");
		}
		
		override public function afterEquip(doOutput:Boolean):void {
			game.flags[kFLAGS.AETHER_DEXTER_TWIN_AT_CAMP] = 2;
			super.afterEquip(doOutput);
		}
		
		override public function unequipText():void {
			outputText("Aether (Dex) lays on the ground for a moment, \"<i>I will be waiting in the camp</i>\" she says before teleporting back to your camp.\n\n(<b>Aether (Dex) is now available in the followers tab!</b>)");
		}
		
		override public function afterUnequip(doOutput:Boolean):void {
			game.flags[kFLAGS.AETHER_DEXTER_TWIN_AT_CAMP] = 1;
			super.afterUnequip(doOutput);
		}
		
		override public function beforeUnequip(doOutput:Boolean):ItemType {
			return WeaponLib.FISTS;
		}
	}
}
