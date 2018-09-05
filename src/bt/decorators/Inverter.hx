package bt.decorators;

import bt.Behavior.BehaviorContext;
/**
 * ...
 * @author https://github.com/deepcake
 */
class Inverter<T:BehaviorContext> extends Decorator<T> {


    public function new(child:Behavior<T>) super(child);


    override public function update(context:T, dt:Float):Status {
        var status = child.exec(context, dt);
        return status == Success ? Failure : (status == Failure ? Success : status);
    }

}