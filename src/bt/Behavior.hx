package bt;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Behavior<T:Blackboard> {


	static var __SEQUENCE = 0;


	public var id:Int;


	public function new() {
		id = ++__SEQUENCE;
	}


	public function open(context:T) { }

	public function update(context:T, dt:Float):Status return Empty;

	public function close(context:T) { }


	public function execute(context:T, dt:Float):Status {
		if (!context.opened(id)) {
			open(context);
			context.open(id);
		}

		var status = update(context, dt);

		if (status != Running) {
			close(context);
			context.close(id);
		}

		return status;
	}

}