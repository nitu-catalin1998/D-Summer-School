int sum(int a, int b)
{
    return a + b;
}
 
void main()
{
    enum a = 5;
    enum b = 7;
    enum c = sum(a, b);
    import std.stdio : writeln;
    writeln(c);
}