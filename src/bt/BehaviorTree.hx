package bt;

import bt.Behavior.BehaviorContext;
/**
 * ...
 * @author https://github.com/wimcake
 */
class BehaviorTree<T:BehaviorContext> {


    public var root:Behavior<T>;


    public function new(root:Behavior<T>) {
        this.root = root;
    }

    public function update(context:T, dt:Float):Status {
        return root.exec(context, dt);
    }


    public function toString() {
        return root.print();
    }


}