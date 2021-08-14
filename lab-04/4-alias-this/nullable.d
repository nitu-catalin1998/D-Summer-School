import std.exception;

struct Nullable(T)
{
    T init;
    bool isNull = true;

    T get()
    {
        enforce(isNull == false, "is null");
        return init;
    }

    void opAssign(T value)
    {
        init = value;
        isNull = false;
    }

    this(T value)
    {
        init = value;
        isNull = false;
    }

    alias init this;
}

unittest
{
    Nullable!(int) test;
    assertThrown(test.get());
    test = 1;
    assert(test.get() == 1);
    test += 1;
    assert(test.get() == 2);
}

void main()
{
}