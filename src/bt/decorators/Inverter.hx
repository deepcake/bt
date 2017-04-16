package bt.decorators;

/**
 * ...
 * @author octocake1
 */
class Inverter<T:Blackboard> extends Decorator<T> {
	
	
	public function new(child:Behavior<T>) super(child);
	
	
	override public function update(context:T, dt:Float):Status {
		var status = child.execute(context, dt);
		return status == Success ? Failure : (status == Failure ? Success : status);
	}
	
}