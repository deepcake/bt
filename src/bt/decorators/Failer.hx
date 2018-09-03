package bt.decorators;

import bt.Behavior.BehaviorContext;
/**
 * ...
 * @author https://github.com/wimcake
 */
class Failer<T:BehaviorContext> extends Decorator<T> {


    public function new(child:Behavior<T>) super(child);


    override public function update(context:T, dt:Float):Status {
        child.exec(context, dt);
        return Failure;
    }

}