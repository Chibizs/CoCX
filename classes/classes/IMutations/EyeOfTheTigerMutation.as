/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Races;

public class EyeOfTheTigerMutation extends IMutationPerkType
    {
        private static const mName:String = "Eye Of The Tiger";
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier == 1){
                descS = " Increase precision of all attacks by 5%. Increase Rake and Claw attack damage by 50%.";
            }
            if (pTier == 2){
                descS = "Increase precision of all attacks by 5% and increase critical chance with natural weapons and weapons by 5%. Increase Rake and Claw attack damage by 50%.";
            }
            if (pTier == 3){
                descS += "Increase precision of all attacks by 5% and increase critical chance with natural weapons and weapons by 5%. Increase Rake and Claw attack damage by 50%. Critical strikes from claw attacks inflict bleed damage.";
            }
            if (pTier == 4){
                descS += "Increase precision of all attacks by 5% and increase critical chance with natural weapons and weapons by 5%. Increase Rake and Claw attack damage by 50%. Critical strikes from claw attacks inflict bleed damage. Increase Natural weapon critical damage by 50%.";
            }
            return descS;
        }

        //Name. Need it say more?
        override public function name(params:PerkClass=null):String {
            var sufval:String;
            switch (currentTier(this, player)){
                case 2:
                    sufval = "(Primitive)";
                    break;
                case 3:
                    sufval = "(Evolved)";
                    break;
                case 4:
                    sufval = "(Final Form)";
                    break;
                default:
                    sufval = "";
            }
            return mName + sufval;
        }

        //Mutation Requirements
        override public function pReqs(pCheck:int = -1):void{
            try{
                var pTier:int = (pCheck != -1 ? pCheck : currentTier(this, player));
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireEyesMutationSlot()
                        .requireAnyRace(Races.CatlikeRaces);
                }
                else{
                    var pLvl:int = pTier * 30;
                    this.requireLevel(pLvl);
                }
            }catch(e:Error){
                trace(e.getStackTrace());
            }
        }
        
        //Mutations Buffs
        override public function buffsForTier(pTier:int, target:Creature):Object {
            var pBuffs:Object = {};
            if (pTier == 1){
                pBuffs['int.mult'] = 0.05;
            }
            if (pTier == 2){
                pBuffs['int.mult'] = 0.15;
                pBuffs['lib.mult'] = 0.05;
            }
            if (pTier == 3){
                pBuffs['int.mult'] = 0.25;
                pBuffs['lib.mult'] = 0.10;
            }
            return pBuffs;
        }

        public function EyeOfTheTigerMutation() {
            super(mName + " IM", mName, SLOT_EYES, 4);
        }

    }
}
