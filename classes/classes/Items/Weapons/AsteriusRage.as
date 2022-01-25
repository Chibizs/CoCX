/**
 * ...
 * @author Ormael
 */
package classes.Items.Weapons 
{
	import classes.Items.Weapon;
	import classes.PerkLib;
	import classes.Player;
	
	public class AsteriusRage extends Weapon {
		
		public function AsteriusRage() {
			super("A.R", "A.R", "Asterius Rage", "a pair of massive magical axes large enough for a minotaur", "cleaves", 60, 20000, "This pair of massive axes once belonged to Asterius the god of the minotaurs.  It'd be hard for anyone smaller than a giant to wield effectively and as a mather of fact seems to work best in the hand of someone of truly titanic strength.  Those axes are double-bladed and deadly-looking.  Requires height of 6'6 or above\".", "Dual Large, LGWrath", "Axe");
		}
		
		override public function get attack():Number {
			var boost:int = 0;
			if (game.player.str >= 1000) boost += 20;
			if (game.player.str >= 210) boost += 10;
			if (game.player.str >= 140) boost += 10;
			if (game.player.str >= 70) boost += 10;
			boost += (game.player.cor) / 5;
			return (10 + boost);
		}
		
		override public function canUse():Boolean {
			if (game.player.hasPerk(PerkLib.DualWield) && game.player.hasPerk(PerkLib.GigantGrip)) return super.canUse();
			if (!game.player.hasPerk(PerkLib.DualWield)) outputText("You aren't skilled in handling large weapons with one hand yet to effectively use those axes. Unless you want to hurt yourself instead enemies when trying to use them...  ");
			else outputText("You aren't skilled enough to handle this pair of weapons!  ");
			return false;
		}	
	}
}