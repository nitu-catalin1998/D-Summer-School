T fun(T)(int a, T b)
{
    static if(is(typeof(a) : int))
        return b;
    else
        return a;
}

void main()
{
    fun(2, "hello");
    fun(2, 2.0);
}