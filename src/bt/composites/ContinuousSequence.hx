package bt.composites;

/**
 * ...
 * @author https://github.com/wimcake
 */
class ContinuousSequence<T:Blackboard> extends Composite<T> {


	public function new(children:Array<Behavior<T>>) super(children);


	override public function update(context:T, dt:Float):Status {
		var i:Int = context.getIndex(id);

		while (i < count) {

			var status = children[i].execute(context, dt);

			if (status != Success) {
				if (status == Running) context.setIndex(id, i);
				return status;
			}

			++i;

		}

		return Success;
	}

}