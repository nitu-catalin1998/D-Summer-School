import std;

struct Struct
{
    int a;

    this(int a)
    {
        this.a = a;
    }

    auto opCmp(R)(R rhs) const
    if (is(R == Struct))
    {
        return a - rhs.a;
    }
}

struct StructChild
{
    Struct s;

    this(int a)
    {
        s = Struct(a);
    }

    alias s this;
}

class Class
{
    int a;

    this(int a)
    {
        this.a = a;
    }

    auto opCmp(R)(R rhs) const
    if (is(R == Class))
    {
        return a - rhs.a;
    }
}

class SubClass : Class
{
    this(int a)
    {
        super(a);
    }
}

int generic_partitioning_search(T)(T[] arr, T key)
if (isOrderingComparable!T)
{
    pragma(msg, T);
    int count = 0;
    foreach (e; arr)
    {
        if (e < key)
        {
            count++;
        }
    }
    return count;
}

int generic_partitioning_search(T, S)(S[T] aa, T key)
if (isOrderingComparable!T)
{
    pragma(msg, T);
    int count = 0;
    foreach (e; aa.keys)
    {
        if (e < key)
        {
            count++;
        }
    }
    return count;
}

unittest
{
    float[] arr = [0, 1, 2, 3, 4];
    assert(generic_partitioning_search!float(arr, 3.0) == 3);
}

unittest
{
    string[long] aa;
    aa[0] = "a";
    aa[1] = "b";
    aa[2] = "c";
    aa[3] = "d";
    aa[4] = "e";
    assert(generic_partitioning_search!(long, string)(aa, 3) == 3);
}

unittest
{
    Struct[] arr = [Struct(0), Struct(1), StructChild(2), StructChild(3), Struct(4)];
    assert(generic_partitioning_search!Struct(arr, StructChild(3)) == 3);
}

unittest
{
    string[Struct] aa;
    aa[Struct(0)] = "a";
    aa[Struct(1)] = "b";
    aa[StructChild(2)] = "c";
    aa[StructChild(3)] = "d";
    aa[Struct(4)] = "e";
    assert(generic_partitioning_search!(Struct, string)(aa, StructChild(3)) == 3);
}

unittest
{
    Class[] arr = [new Class(0), new Class(1), new SubClass(2), new SubClass(3), new Class(4)];
    assert(generic_partitioning_search!Class(arr, new SubClass(3)) == 3);
}

unittest
{
    string[Class] aa;
    aa[new Class(0)] = "a";
    aa[new Class(1)] = "b";
    aa[new SubClass(2)] = "c";
    aa[new SubClass(3)] = "d";
    aa[new Class(4)] = "e";
    assert(generic_partitioning_search!(Class, string)(aa, new SubClass(3)) == 3);
}

unittest
{
    string[] arr = ["aa", "ab", "ba", "bb", ""];
    assert(generic_partitioning_search!string(arr, "ba") == 3);
}

unittest
{
    string[string] aa;
    aa["aa"] = "a";
    aa["ab"] = "b";
    aa["ba"] = "c";
    aa["bb"] = "d";
    aa[""] = "e";
    assert(generic_partitioning_search!(string, string)(aa, "ba") == 3);
}

void main()
{
}