auto fun(int a, string b)
{
    struct Result
    {
        int a;
        string b;
    }
    Result res = Result(a, b);
    return res;
}

void main()
{
	auto k = fun(1, "foo");
}