package bt;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Blackboard {


    var runmemory:Map<Int, Int> = new Map();


    @:noCompletion @:allow(bt) inline function open(id:Int) {
        runmemory[id] = 0;
    }

    @:noCompletion @:allow(bt) inline function close(id:Int) {
        runmemory[id] = -1;
    }

    @:noCompletion @:allow(bt) inline function isOpened(id:Int):Bool {
        return runmemory.exists(id) && runmemory[id] > -1;
    }

    @:noCompletion @:allow(bt) inline function setContinue(id:Int, i:Int) {
        runmemory[id] = i;
    }

    @:noCompletion @:allow(bt) inline function getContinue(id:Int):Int {
        return runmemory.exists(id) ? runmemory[id] : -1;
    }

}