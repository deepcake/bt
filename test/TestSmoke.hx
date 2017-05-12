package;

import bt.Behavior;
import bt.BehaviorTree;
import bt.Blackboard;
import bt.Status;
import bt.composites.ContinuousPriority;
import bt.composites.ContinuousSequence;
import bt.composites.Sequence;
import bt.decorators.Failer;
import bt.decorators.Succeeder;
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

				new Succeeder(new SomeCheck('Some everytime check')),

				new ContinuousPriority([

					new ContinuousSequence([
						new SomeCheck('Check 1 for A'),
						new SomeCheck('Check 2 for A'),
						new SomeCheck('Check 3 for A'),
						new SomeProcess('Do A!'),
						new Succeeder(new SomeCheck('Complete A')),
					]),
					new ContinuousSequence([
						new SomeCheck('Check 1 for B'),
						new SomeCheck('Check 2 for B'),
						new SomeProcess('Do B!'),
						new Succeeder(new SomeCheck('Complete B')),
					]),
					new ContinuousSequence([
						new SomeCheck('Check 1 for C'),
						new SomeCheck('Check 2 for C'),
						new SomeProcess('Do C!'),
						new Succeeder(new SomeCheck('Complete C')),
					]),

					new Failer(new SomeProcess('Do nothing')),

				]),

			])

		);

		var bb = new BlackishBoard();

		inline function go() { trace('\n---\n'); bt.run(bb, .0); }

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