import std;

bool ordered(alias less = "a < b", T...)(T values)
if ((T.length == 2 && is(typeof(binaryFun!less(values[1], values[0])) : bool))
    ||
    (T.length > 2 && is(typeof(ordered!less(values[0 .. 1 + $ / 2])))
        && is(typeof(ordered!less(values[$ / 2 .. $]))))
    )
{
    foreach (i, _; T[0 .. $ - 1])
    {
        if (binaryFun!less(values[i + 1], values[i]))
        {
            assert(!binaryFun!less(values[i], values[i + 1]),
                __FUNCTION__ ~ ": incorrect non-strict predicate.");
            return false;
        }
    }
    return true;
}

///
@safe unittest
{
    assert(ordered(42, 42, 43));
    assert(ordered(42, 42, 43));
    assert(!ordered(43, 42, 45));
    // Ordered lexicographically
    assert(ordered("Jane", "Jim", "Joe"));
    // Incidentally also ordered by length decreasing
    assert(ordered!((a, b) => a.length > b.length)("Jane", "Jim", "Joe"));
}

void main()
{
}