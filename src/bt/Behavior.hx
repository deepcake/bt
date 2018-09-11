package bt;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Behavior<T:BehaviorContext> {


    static var __IDSEQUENCE = 0;


    public var id:Int;


    var opened:Bool;


    public function new() {
        id = ++__IDSEQUENCE;
    }


    public function open(context:T) { }

    public function update(context:T, dt:Float):Status return Empty;

    public function close(context:T) { }


    @:allow(bt) function exec(context:T, dt:Float):Status {
        if (!opened) {
            open(context);
            opened = true;
        }

        var status = update(context, dt);

        if (status != Running) {
            close(context);
            opened = false;
        }

        return status;
    }


    public function print() {
        return '$this:$id';
    }


}


typedef BehaviorContext = {
    function open(id:Int):Void;
    function close(id:Int):Void;
    function isOpened(id:Int):Bool;
}