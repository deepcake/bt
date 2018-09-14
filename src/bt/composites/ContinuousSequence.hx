package bt.composites;

/**
 * ...
 * @author https://github.com/deepcake
 */
class ContinuousSequence<T> extends ContinuousComposite<T> {


    public function new(children:Array<Behavior<T>>) super(children);


    override public function update(context:T, dt:Float):Status {
        var i = index;

        while (i < count) {

            var status = children[i].exec(context, dt);

            if (status != Success) {
                if (status == Running) index = i;
                return status;
            }

            ++i;

        }

        return Success;
    }

}