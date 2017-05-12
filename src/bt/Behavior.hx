package bt;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Behavior<T:Blackboard> {


	static var __IDSEQUENCE = 0;


	public var id:Int;


	public function new() {
		id = ++__IDSEQUENCE;
	}


	public function open(context:T) { }

	public function update(context:T, dt:Float):Status return Empty;

	public function close(context:T) { }


	@:allow(bt) function exec(context:T, dt:Float):Status {
		if (!context.isOpened(id)) {
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