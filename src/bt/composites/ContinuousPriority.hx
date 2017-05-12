package bt.composites;

/**
 * ...
 * @author https://github.com/wimcake
 */
class ContinuousPriority<T:Blackboard> extends Composite<T> {


	public function new(children:Array<Behavior<T>>) super(children);


	override public function update(context:T, dt:Float):Status {
		var i = context.getContinue(id);

		while (i < count) {

			var status = children[i].exec(context, dt);

			if (status != Failure) {
				if (status == Running) context.setContinue(id, i);
				return status;
			}

			++i;

		}

		return Failure;
	}

}