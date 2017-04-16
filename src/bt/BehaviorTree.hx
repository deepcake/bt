package bt;

/**
 * ...
 * @author octocake1
 */
class BehaviorTree<T:Blackboard> {
	
	
	public var root:Behavior<T>;
	
	
	public function new(root:Behavior<T>) {
		this.root = root;
	}
	
	public function execute(value:T, dt:Float) {
		root.execute(value, dt);
	}
	
}