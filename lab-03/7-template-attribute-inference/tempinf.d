void takePointer(int*) @safe {}
void takeRef(T)(ref T) @safe {}

void func(T)(T a) @trusted
{
    static if(is(T == int))
        takePointer(&a);
    else
        takeRef(a);
}

void main() @safe
{
    func(2);
    func("asd");
}