package;

import bt.Behavior;
import bt.BehaviorTree;
import bt.Blackboard;
import bt.Status;
import bt.composites.ContinuousPriority;
import bt.composites.ContinuousSequence;
import bt.composites.Sequence;
import bt.decorators.Failer;
import haxe.unit.TestCase;

/**
 * ...
 * @author https://github.com/wimcake
 */
class TestSmoke extends TestCase {

	public function new() {
		super();
	}

	public function test1() {
		var bt = new BehaviorTree(
			new Sequence([

				new ContinuousPriority([

					new ContinuousSequence([
						new SomeCheck('A1'),
						new SomeCheck('A2'),
						new SomeCheck('A3'),
						new SomeProcess('A!'),
					]),
					new ContinuousSequence([
						new SomeCheck('B1'),
						new SomeCheck('B2'),
						new SomeCheck('B3'),
						new SomeProcess('B!'),
					]),
					new ContinuousSequence([
						new SomeCheck('C1'),
						new SomeCheck('C2'),
						new SomeCheck('C3'),
						new SomeProcess('C!'),
					]),

					new Failer(new SomeProcess('Nothing to do')),

				]),

			])

		);

		var bb = new BlackishBoard();

		inline function go() { trace('---'); bt.run(bb, .0); }

		go();
		go();
		go();
		go();
		go();
	}

}

class SomeCheck extends Behavior<BlackishBoard> {
	var val = '';
	public function new(val:String) {
		super();
		this.val = val;
	}
	override public function update(context:BlackishBoard, dt:Float):Status {
		trace(val);
		return Math.random() > .5 ? Status.Success : Status.Failure;
	}
}

class SomeProcess extends Behavior<BlackishBoard> {
	var val = '';
	public function new(val:String) {
		super();
		this.val = val;
	}
	override public function update(context:BlackishBoard, dt:Float):Status {
		trace(val);
		return Math.random() > .7 ? Status.Success : Status.Running;
	}
}

class BlackishBoard extends Blackboard {

}