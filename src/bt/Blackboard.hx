package bt;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Blackboard {


    var behaviors:Map<Int, Bool> = new Map();

    public var continuous:Map<Int, Int> = new Map();


    public function open(id:Int) {
        behaviors[id] = true;
    }

    public function close(id:Int) {
        behaviors[id] = false;
    }

    public function isOpened(id:Int):Bool {
        return behaviors.exists(id) && behaviors[id];
    }


}