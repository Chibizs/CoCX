/**
 * ...
 * @author Liadri
 */
package classes.Items.Armors
{
import classes.Items.Armor;
import classes.Items.ItemTags;
import classes.PerkLib;
import classes.Player;
import classes.StatusEffects;

	public class InariBlessedKimono extends ArmorWithPerk {
		
		public function InariBlessedKimono()
		{
			super("I.B.Kimono","I.B.Kimono","Inari Blessed Kimono","a Inari Blessed Kimono",0,30,12000,"It is said that this beautiful Kimono decorated with flower motifs was worn by lady Inari, firstborn of Taoth who became the first leader of the kitsunes. Increase the potency of spells and soulskill by up to 50% based on purity and empower all Kitsunes ability. Like most kitsune outfit this Kimono is made to improve ones charms and thus leaves you as agile as if naked.","Light",
				PerkLib.WizardsAndDaoistsEndurance,60,0,0,0);
				withTag(ItemTags.REVEALING);
		}
		
		override public function afterEquip(slot:int, doOutput:Boolean):void {
			if (!game.isLoadingSave) {
				while (game.player.hasPerk(PerkLib.InariBlessedKimono)) game.player.removePerk(PerkLib.InariBlessedKimono);
				game.player.createPerk(PerkLib.InariBlessedKimono, 0, 0, 0, 0);
				while (game.player.hasPerk(PerkLib.SluttySeduction)) game.player.removePerk(PerkLib.SluttySeduction);
				game.player.createPerk(PerkLib.SluttySeduction, 15, 0, 0, 0);
			}
			super.afterEquip(slot, doOutput);
		}
		
		override public function afterUnequip(slot:int, doOutput:Boolean):void {
			while (game.player.hasPerk(PerkLib.InariBlessedKimono)) game.player.removePerk(PerkLib.InariBlessedKimono);
			while (game.player.hasPerk(PerkLib.SluttySeduction)) game.player.removePerk(PerkLib.SluttySeduction);
			super.afterUnequip(slot, doOutput);
		}
		
		override public function canUse():Boolean {
			if (game.player.level >= 40) return super.canUse();
			outputText("You try and wear the legendary armor but to your disapointment the item simply refuse to stay on your body. It would seem you yet lack the power and right to wield this item.");
			return false;
		}
	}
}
