package bt.decorators;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Decorator<T:Blackboard> extends Behavior<T> {


	var child:Behavior<T>;


	public function new(child:Behavior<T>) {
		super();
		this.child = child;
	}

	override public function close(context:T) {
		if (context.opened(child.id)) {
			child.close(context);
			context.close(child.id);
		}
	}

}