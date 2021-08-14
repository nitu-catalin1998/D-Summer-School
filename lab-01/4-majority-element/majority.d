int majority(int[] arr)
{
    int[int] map;
    int max_value = -1;
    int max_count = 0;
    foreach (a; arr)
    {
        auto p = a in map;
        if (p)
            *p += 1;
        else
            map[a] = 1;
        if (map[a] > max_count)
        {
            max_value = a;
            max_count = map[a];
        }
    }
    return max_value;
}

int majority_bonus(int[] arr)
{
    int value = -1;
    int count = 0;
    foreach (a; arr) {
        if (count == 0)
            value = a;
        count += (a == value) ? 1 : -1;
    }
    return value;
}

unittest
{
	int[] arr = [3, 2, 3];
    assert(majority(arr) == 3);
    assert(majority_bonus(arr) == 3);
    arr = [2, 2, 1, 1, 1, 2, 2];
    assert(majority(arr) == 2);
    assert(majority_bonus(arr) == 2);
    arr = [7, 7, 5, 7, 5, 1, 5, 7, 5, 5, 7, 7, 7, 7, 7, 7];
    assert(majority(arr) == 7);
    assert(majority_bonus(arr) == 7);
    arr = [7, 7, 5, 7, 5, 1, 5, 7, 5, 5, 7, 7, 5, 5, 5, 5];
    assert(majority(arr) == 5);
    assert(majority_bonus(arr) == 5);
}

void main()
{
}