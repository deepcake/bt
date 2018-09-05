package;

import bt.Status;

class Timer extends SpecBehavior {


    var timer:Float;

    public function new(title:String, timer:Float) {
        super(title);
        this.timer = timer;
    }

    override function open(context:SpecBlackboard) {
        super.open(context);
        context.timers.set(this.id, .0);
    }

    override function update(context:SpecBlackboard, dt:Float):Status {
        super.update(context, dt);

        var time = context.timers.get(this.id) + dt;

        if (time >= timer) {
            return Success;
        } else {
            context.timers.set(this.id, time);
            return Running;
        }
    }

    override function close(context:SpecBlackboard) {
        super.close(context);
        context.timers.set(this.id, .0);
    }


}