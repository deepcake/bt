package;

import haxe.unit.TestRunner;

/**
 * ...
 * @author octocake1
 */
class Main {
	
	static public function main() {
		var r = new TestRunner();
		
		r.add(new TestSmoke());
		
		var ret = r.run();
		
		#if sys
		Sys.exit(ret ? 0 : 1);
		#end
	}
	
}
