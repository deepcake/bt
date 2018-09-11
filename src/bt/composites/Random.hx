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
        index = Std.random(count);
    }

    override public function update(context:T, dt:Float):Status {
        var i = index;

        var status = children[i].exec(context, dt);

        if (status == Running) index = i;

        return status;
    }


}
