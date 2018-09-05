package bt;

/**
 * ...
 * @author https://github.com/deepcake
 */
@:enum abstract Status(Int) from Int to Int {

    var Empty = 0;
    var Success = 1;
    var Failure = 2;
    var Running = 3;

}