package bt.decorators;

/**
 * ...
 * @author octocake1
 */
class Failer<T> extends Decorator<T> {
	

	public function new(child:Behavior<T>) super(child);
	
	
	override public function update(context:T, dt:Float):Status {
		child.execute(context, dt);
		return Failure;
	}
	
}