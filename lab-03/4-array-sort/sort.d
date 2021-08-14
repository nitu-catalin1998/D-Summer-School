import std.traits;
import std.algorithm;

void bubblesort(T)(ref T[] arr)
{
    int n = cast(int)arr.length;
    for ({int i = 0; bool swapped = true;} i < n - 1 && swapped; i++)
    {
        swapped = false;
        for (int j = i + 1; j < n; j++)
            if (arr[i] > arr[j])
        	{
            	swap(arr[i], arr[j]);
            	swapped = true;
        	}
    }
}

auto sort(T)(T[] array)
if (isMutable!(T))
{
    bubblesort(array);
    return array;
}

auto sort(T)(T[] array)
if (!isMutable!(T))
{
    return sort(array.dup());
}

unittest
{
    int[] m_array = [3, 1, 4, 2];
    const int[] c_array = [3, 1, 4, 2];
    immutable int[] i_array = [3, 1, 4, 2];
    assert(sort(m_array) == [1, 2, 3, 4]);
    assert(sort(c_array) == [1, 2, 3, 4]);
    assert(sort(i_array) == [1, 2, 3, 4]);
    assert(m_array == [1, 2, 3, 4]);
    assert(c_array == [3, 1, 4, 2]);
    assert(i_array == [3, 1, 4, 2]);
}

void main()
{
}