package bt.composites;

using StringTools;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Composite<T> extends Behavior<T> {


    var children:Array<Behavior<T>>;
    var count:Int;


    public function new(children:Array<Behavior<T>>) {
        super();
        this.children = children;
        this.count = children.length;
    }


    override public function close(context:T) {
        for (ch in children) {
            if (ch.opened) {
                ch.close(context);
            }
        }
    }


    override public function print() {
        var out = ('\n' + [ for (ch in children) ch.print() ].join('\n')).replace("\n", "\n\t");
        return '$this:$id:[${out}\n]';
    }


}