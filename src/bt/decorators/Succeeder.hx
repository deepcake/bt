package bt.decorators;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Succeeder<T:Blackboard> extends Decorator<T> {


	public function new(child:Behavior<T>) super(child);


	override public function update(context:T, dt:Float):Status {
		child.exec(context, dt);
		return Success;
	}

}