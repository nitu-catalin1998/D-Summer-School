import std.traits : isNumeric;
import std.stdio : writeln;

T sum(T)(T[] array)
if (isNumeric!T)
{
    if (array.length == 0)
    {
        return 0;
    }
    return array[0] + sum(array[1 .. $]);
}

void main()
{
    {
        int[] arr = [1, 2, 3, 4, 5];
        writeln(sum!int(arr)); // 15
    }
    {
    	float[] arr = [1.0, 2.0, 3.0, 4.0, 5.0];
        writeln(sum!float(arr)); // 15
    }
}