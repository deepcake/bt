package bt;

/**
 * ...
 * @author https://github.com/wimcake
 */
class BehaviorTree<T:Blackboard> {


	public var root:Behavior<T>;


	public function new(root:Behavior<T>) {
		this.root = root;
	}

	public function update(context:T, dt:Float):Status {
		return root.exec(context, dt);
	}

}