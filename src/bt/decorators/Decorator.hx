package bt.decorators;

using StringTools;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Decorator<T:Blackboard> extends Behavior<T> {


    var child:Behavior<T>;


    public function new(child:Behavior<T>) {
        super();
        this.child = child;
    }

    override public function close(context:T) {
        if (context.isOpened(child.id)) {
            child.close(context);
            context.close(child.id);
        }
    }


    override public function print() {
        var out = ('\n' + child.print()).replace("\n", "\n\t");
        return '$this:$id:{${out}\n}';
    }


}