package;

import bt.Status;

class SpecBehavior extends bt.Behavior<SpecBlackboard> {


    var title:String;

    public function new(title:String) {
        super();
        this.title = title;
    }

    override function update(context:SpecBlackboard, dt:Float):Status {
        context.last = title;
        context.log += title + ',';
        return super.update(context, dt);
    }


}