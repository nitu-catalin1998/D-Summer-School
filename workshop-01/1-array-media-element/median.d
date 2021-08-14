import std.algorithm;

int median(int[] arr)
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
    int j = 0;
    for (int i = 0; i < arr.length - 1; i++)
        if (arr[i] != arr[i + 1])
        {
            arr[j] = arr[i];
            j++;
        }
    arr[j] = arr[$ - 1];
    j++;
    arr.length = j;
    if (arr.length % 2 == 0)
        return (arr[($ - 1) / 2] + arr[$ / 2]) / 2;
    return arr[$ / 2];
}

unittest
{
    int[] arr = [1, 0, -1];
    assert(median(arr) == 0);
    arr = [2, 1, 3];
    assert(median(arr) == 2);
    arr = [1, 0, -1, 2];
    assert(median(arr) == 0);
    arr = [3, 1, 4, 2];
    assert(median(arr) == 2);
    arr = [3, 1, 1, 1];
    assert(median(arr) == 2);
}

void main()
{
}