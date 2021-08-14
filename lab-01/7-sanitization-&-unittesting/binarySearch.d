int binarySearch(int[] arr, int l, int r, int x)
{
    if (r > l)
    {
        int mid = l + (r - l) / 2;

        if (arr[mid] == x)
            return mid;

        if (arr[mid] > x)
            return binarySearch(arr, l, mid, x);

        return binarySearch(arr, mid + 1, r, x);
    }

    return -1;
}

int binarySearch(int[] arr, int x)
{
    int n = cast(int)arr.length;
    if (n == 0)
        return -1;

    int mid = n / 2;

    if (arr[mid] == x)
        return mid;

    if (arr[mid] > x)
        return binarySearch(arr[0 .. mid], x);

    int result = binarySearch(arr[mid + 1 .. n], x);
    if (result != -1)
        return result + mid + 1;

    return -1;
}

unittest
{
    int[] arr = [1, 2, 4, 5, 7, 9];
    assert(arr.binarySearch(0, cast(int)arr.length, 0) == -1);
    assert(arr.binarySearch(0, cast(int)arr.length, 1) == 0);
    assert(arr.binarySearch(0, cast(int)arr.length, 2) == 1);
    assert(arr.binarySearch(0, cast(int)arr.length, 3) == -1);
    assert(arr.binarySearch(0, cast(int)arr.length, 4) == 2);
    assert(arr.binarySearch(0, cast(int)arr.length, 5) == 3);
    assert(arr.binarySearch(0, cast(int)arr.length, 6) == -1);
    assert(arr.binarySearch(0, cast(int)arr.length, 7) == 4);
    assert(arr.binarySearch(0, cast(int)arr.length, 8) == -1);
    assert(arr.binarySearch(0, cast(int)arr.length, 9) == 5);
    assert(arr.binarySearch(0, cast(int)arr.length, 10) == -1);
    assert(arr.binarySearch(0) == -1);
    assert(arr.binarySearch(1) == 0);
    assert(arr.binarySearch(2) == 1);
    assert(arr.binarySearch(3) == -1);
    assert(arr.binarySearch(4) == 2);
    assert(arr.binarySearch(5) == 3);
    assert(arr.binarySearch(6) == -1);
    assert(arr.binarySearch(7) == 4);
    assert(arr.binarySearch(8) == -1);
    assert(arr.binarySearch(9) == 5);
    assert(arr.binarySearch(10) == -1);
}

void main()
{
    import std.stdio : writeln;

    int[] arr = [1, 2, 4, 5, 7, 9];
    auto pos = arr.binarySearch(0, cast(int)arr.length, 2);
    writeln(pos);
}