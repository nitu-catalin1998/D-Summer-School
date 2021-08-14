void printArguments(T...)(T t)
{
    pragma(msg, T);
    static if(T.length == 0)
        return;
    else
    {
        import std.stdio : writeln;
        writeln(t[0]);
    	pragma(msg, typeof(t[0]));
    	pragma(msg, typeof(t[1 .. $]));
        printArguments(t[1 .. $]);
    }
}

struct MyClass
{
    string toString() const
    {
         return "MyClass Type";
    }
}

void main()
{
    printArguments!(int, string, MyClass)(2, "aha", MyClass());
}