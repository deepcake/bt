package bt.composites;

import bt.composites.ContinuousComposite.ContinuousContext;

/**
 * ...
 * @author https://github.com/deepcake
 */
class ContinuousSequence<T:ContinuousContext> extends ContinuousComposite<T> {


    public function new(children:Array<Behavior<T>>) super(children);


    override public function update(context:T, dt:Float):Status {
        var i = context.continuous.get(id);

        while (i < count) {

            var status = children[i].exec(context, dt);

            if (status != Success) {
                if (status == Running) context.continuous.set(id, i);
                return status;
            }

            ++i;

        }

        return Success;
    }

}