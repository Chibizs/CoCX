/**
 * All the variables that have been left around but don't fit into the GlobalVariables file
 */

// import classes.creature;

//Used when save/loading
public var notes:String = "";
// nameBox.maxChars = 54;

//Images for image pack!
//NO! Images now work through ImageManager in GlobalVariables
//var images = new Array();

//System time
public var date:Date = new Date();

//Used to set what each action buttons displays and does. I don't know why it is initialized here.
//var args:Array = new Array();
//var funcs:Array = new Array();

//Loeri stuff
//import flash.system.*
 
//if ( ApplicationDomain.currentDomain.hasDefinition("Creature")) trace("Class exists");

//dungeoneering variables
public var inDungeon:Boolean = false;
public var dungeonLoc:int = 0;

// To save shitting up a lot of code...
public var inRoomedDungeon:Boolean = false;
public var inRoomedDungeonResume:Function = null;

//Used to restrict random drops from overlapping uniques
public var plotFight:Boolean = false;
public var timeQ:Number = 0;
public var campQ:Boolean = false;
public var levelCap:int = 40;