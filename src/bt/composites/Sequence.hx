package bt.composites;

import bt.Behavior.BehaviorContext;
/**
 * ...
 * @author https://github.com/deepcake
 */
class Sequence<T:BehaviorContext> extends Composite<T> {


    public function new(children:Array<Behavior<T>>) super(children);


    override public function update(context:T, dt:Float):Status {
        var i = 0;

        while (i < count) {

            var status = children[i].exec(context, dt);

            if (status != Success) return status;

            ++i;

        }

        return Success;
    }

}