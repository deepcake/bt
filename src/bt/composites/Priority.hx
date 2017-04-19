package bt.composites;

/**
 * ...
 * @author octocake1
 */
class Priority<T:Blackboard> extends Composite<T> {
	
	
	public function new(children:Array<Behavior<T>>) super(children);
	
	
	override public function update(context:T, dt:Float):Status {
		var i = 0;
		
		while (i < count) {
			
			var status = children[i].execute(context, dt);
			
			if (status != Failure) return status;
			
			++i;
			
		}
		
		return Failure;
	}
	
}