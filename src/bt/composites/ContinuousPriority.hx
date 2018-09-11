package bt.composites;

/**
 * ...
 * @author https://github.com/deepcake
 */
class ContinuousPriority<T> extends ContinuousComposite<T> {


    public function new(children:Array<Behavior<T>>) super(children);


    override public function update(context:T, dt:Float):Status {
        var i = index;

        while (i < count) {

            var status = children[i].exec(context, dt);

            if (status != Failure) {
                if (status == Running) index = i;
                return status;
            }

            ++i;

        }

        return Failure;
    }

}