package bt.composites;

import bt.composites.ContinuousComposite.ContinuousContext;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Random<T:ContinuousContext> extends ContinuousComposite<T> {


    public function new(children:Array<Behavior<T>>) super(children);


    override function open(context:T) {
        super.open(context);
        context.continuous.set(id, Std.random(count));
    }

    override public function update(context:T, dt:Float):Status {
        var i = context.continuous.get(id);

        var status = children[i].exec(context, dt);

        if (status == Running) context.continuous.set(id, i);

        return status;
    }


}
