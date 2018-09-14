package bt.composites;

/**
 * ...
 * @author https://github.com/deepcake
 */
class ContinuousComposite<T> extends Composite<T> {


    var index:Int = 0;


    public function new(children:Array<Behavior<T>>) super(children);


    override public function open(context:T) {
        super.open(context);
    }

    override public function close(context:T) {
        index = 0;
        super.close(context);
    }


}
