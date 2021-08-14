struct A
{
    int a;

    void foo()
    {
        a = a + 2;
    }
}

void main()
{
    A a;
    a.foo();
}