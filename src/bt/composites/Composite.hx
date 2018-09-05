package bt.composites;

import bt.Behavior.BehaviorContext;
using StringTools;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Composite<T:BehaviorContext> extends Behavior<T> {


    var children:Array<Behavior<T>>;
    var count:Int;


    public function new(children:Array<Behavior<T>>) {
        super();
        this.children = children;
        this.count = children.length;
    }


    override public function close(context:T) {
        for (ch in children) {
            if (context.isOpened(ch.id)) {
                ch.close(context);
                context.close(ch.id);
            }
        }
    }


    override public function print() {
        var out = ('\n' + [ for (ch in children) ch.print() ].join('\n')).replace("\n", "\n\t");
        return '$this:$id:[${out}\n]';
    }


}