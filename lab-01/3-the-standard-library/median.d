import std.algorithm;

int median(int[] arr)
{
    arr.length -= arr.sort().uniq().copy(arr).length;
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