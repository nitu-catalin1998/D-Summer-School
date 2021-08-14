int linearsearch(int[] arr, int size, int val)
{
    int i;
    for (i = 0; i < size; i++)
    {
        if (arr[i] == val)
            return 1;
    }
    return 0;
}

unittest
{
    int[] arr = [-1, 0, 1];
    assert(linearsearch(arr, cast(int)arr.length, -2) == 0);
    assert(linearsearch(arr, cast(int)arr.length, -1) == 1);
    assert(linearsearch(arr, cast(int)arr.length, 0) == 1);
    assert(linearsearch(arr, cast(int)arr.length, 1) == 1);
    assert(linearsearch(arr, cast(int)arr.length, 2) == 0);
}

int linearsearch(int[] arr, int val)
{
    foreach (ref a; arr)
        if (a == val)
            return 1;
    return 0;
}

unittest
{
    int[] arr = [-1, 0, 1];
    assert(linearsearch(arr, -2) == 0);
    assert(linearsearch(arr, -1) == 1);
    assert(linearsearch(arr, 0) == 1);
    assert(linearsearch(arr, 1) == 1);
    assert(linearsearch(arr, 2) == 0);
}

void main()
{
}