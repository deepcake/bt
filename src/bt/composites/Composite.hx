package bt.composites;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Composite<T:Blackboard> extends Behavior<T> {


	var children:Array<Behavior<T>>;
	var count:Int;


	public function new(children:Array<Behavior<T>>) {
		super();
		this.children = children;
		this.count = children.length;
	}

	override public function close(context:T) {
		for (ch in children) {
			if (context.opened(ch.id)) {
				ch.close(context);
				context.close(ch.id);
			}
		}
	}

}