import std.stdio;

void fun(int a)
{
    writeln("called: ", __PRETTY_FUNCTION__);
}

void main()
{
    import func;
    alias fun = func.fun;
    fun();
}