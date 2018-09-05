package;

import bt.Status;

class Condition extends SpecBehavior {


    var value:Bool;

    public function new(title:String, value:Bool) {
        super(title);
        this.value = value;
    }

    override function update(context:SpecBlackboard, dt:Float):Status {
        super.update(context, dt);
        return value ? Success : Failure;
    }


}