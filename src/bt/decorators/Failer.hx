package bt.decorators;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Failer<T> extends Decorator<T> {


    public function new(child:Behavior<T>) super(child);


    override public function update(context:T, dt:Float):Status {
        child.exec(context, dt);
        return Failure;
    }

}