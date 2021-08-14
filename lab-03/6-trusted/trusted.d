import std.stdio;

extern(C) size_t read(int, void*, size_t);

auto safeRead(int fd, ubyte[] buf) @trusted
{
    return read(fd, buf.ptr, buf.length);
}

void main() @safe
{
    char[] a;
    a.length = 5;
    auto b = safeRead(0, cast(ubyte[])a);
    a[b-1] = '\0';
    writeln(a);
}