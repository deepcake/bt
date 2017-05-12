package bt;

/**
 * ...
 * @author https://github.com/wimcake
 */
class Blackboard {


	var indexes:Map<Int, Int> = new Map();


	public function new() { }

	public function open(id:Int) {
		indexes[id] = 0;
	}

	public function close(id:Int) {
		indexes[id] = -1;
	}

	public function setIndex(id:Int, i:Int) {
		indexes[id] = i;
	}

	public function getIndex(id:Int):Int {
		return indexes.exists(id) ? indexes[id] : -1;
	}

	public function opened(id:Int):Bool {
		return indexes.exists(id) ? indexes[id] > -1 : false;
	}

}