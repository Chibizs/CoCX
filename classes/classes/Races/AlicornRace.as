package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.MutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.VaginaClass;
import classes.internals.Utils;

public class AlicornRace extends Race{
	public static const NightmareFurColors:/*String*/Array  = ["silver", "black", "midnight black", "midnight"];
	public static const NightmareHairColors:/*String*/Array = ["silver","black", "midnight black", "midnight"];
	public static const AlicornFurColors:/*String*/Array  = ["white", "pure white"];
	public static const AlicornHairColors:/*String*/Array = ["platinum blonde","silver", "white", "pure white"];
	
	public function AlicornRace(id:int) {
		super("Alicorn", id);
		
		addScores()
				.faceType(Face.HUMAN, +1, -100)
				.hornType(ANY(Horns.UNICORN, Horns.BICORN), 0, -100)
				.earType(Ears.HORSE, +1)
				.tailType(Tail.HORSE, +1)
				.legType(LowerBody.HOOFED, +1)
				.eyeType(Eyes.HUMAN, +1)
				.isTaur(+1)
				.skinPlainOnly(+1)
				.hasCockOfType(CockTypesEnum.HORSE, +1)
				.vaginaType(VaginaClass.EQUINE, +1)
				.mutationPerks([
					MutationsLib.TwinHeart,
					MutationsLib.TwinHeartPrimitive,
					MutationsLib.TwinHeartEvolved
				], +2)
				.mutationPerks([
					MutationsLib.EclipticMind,
					MutationsLib.EclipticMindPrimitive,
					MutationsLib.EclipticMindEvolved
				])
				.chimericalBodyPerks1([
					MutationsLib.TwinHeart,
					MutationsLib.EclipticMind
				])
				.chimericalBodyPerks2([
					MutationsLib.TwinHeartPrimitive,
					MutationsLib.EclipticMindPrimitive
				])
				.chimericalBodyPerks3([
					MutationsLib.TwinHeartEvolved,
					MutationsLib.EclipticMindEvolved
				])
				.hornTypeAndCount(Horns.UNICORN, LESS_THAN(6), +1, 0, "Alicorn branch - size 1-5 unicorn horn")
				.hornTypeAndCount(Horns.UNICORN, AT_LEAST(6), +2, 0, "Alicorn branch - size 6+ unicorn horn")
				.hornTypeAndCount(Horns.UNICORN, LESS_THAN(6), +1, 0, "Nightmare branch - size 1-5 bicorn horns")
				.hornTypeAndCount(Horns.UNICORN, AT_LEAST(6), +2, 0, "Nightmare branch - size 6+ bicorn horns")
				.customRequirement("",
						"Wings match horns",
						function (body:BodyData):Boolean {
							if (body.hornType == Horns.UNICORN) return body.wingType == Wings.FEATHERED_ALICORN;
							if (body.hornType == Horns.BICORN) return body.wingType == Wings.NIGHTMARE;
							return true;
						}, 0, -100);
		addConditionedScores(
				function(body:BodyData):Boolean {
					return body.hornType == Horns.UNICORN;
				}, "Alicorn branch;")
				.wingType(Wings.FEATHERED_ALICORN, +4) // can't -100 here because condition is &&'d with the horn type
				.customRequirement(
						"",
						"hair color: "+AlicornHairColors.join("/")+
						"; coat color: "+AlicornFurColors.join("/"),
						function (body:BodyData):Boolean {
							return Utils.InCollection(body.hairColor, AlicornHairColors) &&
									Utils.InCollection(body.skinCoatColor, AlicornFurColors)
						},
						+1)
				.eyeColor("red", +1)
				.hasPerk(PerkLib.AvatorOfCorruption, +1);
		addConditionedScores(
				function(body:BodyData):Boolean {
					return body.hornType == Horns.BICORN;
				}, "Nightmare branch;")
				.wingType(Wings.NIGHTMARE, +4)
				.customRequirement(
						"",
						"hair color: "+NightmareHairColors.join("/")+
						"; coat color: "+NightmareFurColors.join("/"),
						function (body:BodyData):Boolean {
							return Utils.InCollection(body.hairColor, NightmareHairColors) &&
									Utils.InCollection(body.skinCoatColor, NightmareFurColors)
						},
						+1)
				.eyeColor("blue", +1)
				.hasPerk(PerkLib.AvatorOfPurity, +1);
		
		buildTier(8, "Half Alicorn/Nightmare")
				.customNamingFunction(function(body:BodyData):String {
					if (body.hornType == Horns.UNICORN) return "half alicorn";
					return "half nightmare";
				})
				.buffs({
					"tou.mult": +0.15,
					"spe.mult": +0.50,
					"int.mult": +0.55
				})
				.end()
		
		buildTier(18, "Alicorn/Nightmare")
				.customNamingFunction(function(body:BodyData):String {
					if (body.hornType == Horns.UNICORN) return "alicorn";
					return "nightmare";
				})
				.buffs({
					"tou.mult": +0.55,
					"spe.mult": +1.20,
					"int.mult": +0.95,
					"maxhp_base": +250,
					"maxfatigue_base": +50,
					"maxsf_mult": +0.2
				})
				.withExtraBonuses([
						"Mana & SF recovery +10%",
						"Combat HP regen +200",
						"Regenerate Spell +300%"
				])
				.end()
		
		buildTier(27, "True Alicorn/Nightmare")
				.customNamingFunction(function(body:BodyData):String {
					if (body.hornType == Horns.UNICORN) return "true alicorn";
					return "true nightmare";
				})
				.buffs({
					"str.mult": +0.60,
					"tou.mult": +0.70,
					"spe.mult": +1.50,
					"int.mult": +1.25,
					"maxhp_base": +250,
					"maxfatigue_base": +50,
					"maxsf_mult": +0.2
				})
				.withExtraBonuses([
					"Mana & SF recovery +10%",
					"Combat HP regen +200",
					"Regenerate Spell +300%"
				])
				.end()
	}
}
}
