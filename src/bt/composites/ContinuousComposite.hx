package bt.composites;

import bt.Behavior.BehaviorContext;

/**
 * ...
 * @author https://github.com/deepcake
 */
class ContinuousComposite<T:ContinuousContext> extends Composite<T> {


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


typedef ContinuousContext = {
    > BehaviorContext,
    continuous:Map<Int, Int>
}