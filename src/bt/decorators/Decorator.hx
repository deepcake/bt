package bt.decorators;

using StringTools;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Decorator<T> extends Behavior<T> {


    var child:Behavior<T>;


    public function new(child:Behavior<T>) {
        super();
        this.child = child;
    }

    override public function close(context:T) {
        if (child.opened) {
            child.close(context);
        }
    }


    override public function print() {
        var out = ('\n' + child.print()).replace("\n", "\n\t");
        return '$this:$id:{${out}\n}';
    }


}