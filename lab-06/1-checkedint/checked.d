import std.traits;
import std.stdio : stderr, writeln;

struct CheckedInt(T, Hook)
if (isIntegral!T || is(T == CheckedInt!(S, H), S, H))
{
    private T value;
    private Hook hook;

    void opAssign(R)(R rhs)
    if (isIntegral!R || is(R == CheckedInt!(S, H), S, H))
    {
        static if (isIntegral!R)
        {
        	this.value = rhs;
        }
        else
        {
        	this.value = rhs.value;
        }
    }

    auto opBinary(string op, R)(R rhs)
    if (isIntegral!R || is(R == CheckedInt!(S, H), S, H))
    {
        static if (isIntegral!R)
        {
        	return mixin("this.value " ~ op ~ " rhs");
        }
        else
        {
        	return mixin("this.value " ~ op ~ " rhs.value");
        }
    }

    auto opBinaryRight(string op, L)(L lhs)
    if (isIntegral!L || is(L == CheckedInt!(S, H), S, H))
    {
        static if (isIntegral!L)
        {
        	return mixin("lhs " ~ op ~ " this.value");
        }
        else
        {
        	return mixin("lhs.value " ~ op ~ " this.value");
        }
    }

    type opCast(type)()
    {
        return cast(type) this.value;
    }

    auto opCmp(R)(R rhs)
    if (isIntegral!R || is(R == CheckedInt!(S, H), S, H))
    {
        static if (isIntegral!R)
        {
        	return mixin("this.value - rhs");
        }
        else
        {
        	return mixin("this.value - rhs.value");
        }
    }

    auto opEquals(R)(R rhs)
    if (isIntegral!R || is(R == CheckedInt!(S, H), S, H))
    {
        static if (isIntegral!R)
        {
        	return mixin("this.value == rhs");
        }
        else
        {
        	return mixin("this.value == rhs.value");
        }
    }

    ref auto opOpAssign(string op, R)(R rhs)
    if (isIntegral!R || is(R == CheckedInt!(S, H), S, H))
    {
        static if (isIntegral!R)
        {
        	mixin("this.value " ~ op ~ "= rhs;");
        }
        else
        {
        	mixin("this.value " ~ op ~ "= rhs.value;");
        }
        return this;
    }

    auto opUnary(string op)()
    {
        return CheckedInt(mixin(op ~ "this.value"));
    }
}

struct Abort
{
static:
    Dst onBadCast(Dst, Src)(Src src)
    {
        Warn.onBadCast!Dst(src);
        assert(0);
    }
    T onLowerBound(R, T)(R rhs, T bound)
    {
        Warn.onLowerBound(rhs, bound);
        assert(0);
    }
    T onUpperBound(R, T)(R rhs, T bound)
    {
        Warn.onUpperBound(rhs, bound);
        assert(0);
    }
    auto hookOpEquals(L, R)(L lhs, R rhs)
    {
        Warn.hookOpEquals(lhs, rhs);
        assert(0);
    }
    auto hookOpCmp(L, R)(L lhs, R rhs)
    {
        Warn.hookOpCmp(lhs, rhs);
        assert(0);
    }
    typeof(~L()) onOverflow(string x, L)(L lhs)
    {
        Warn.onOverflow!x(lhs);
        assert(0);
    }
    typeof(L() + R()) onOverflow(string x, L, R)(L lhs, R rhs)
    {
        Warn.onOverflow!x(lhs, rhs);
        assert(0);
    }
}

struct Throw
{
static:
    Dst onBadCast(Dst, Src)(Src src)
    {
        throw new CheckFailure("Erroneous cast: cast(%s) %s(%s)", Dst.stringof, Src.stringof, src);
    }
    T onLowerBound(R, T)(R rhs, T bound)
    {
        throw new CheckFailure("Lower bound error: %s(%s) < %s(%s)", R.stringof, rhs, T.stringof, bound);
    }
    T onUpperBound(R, T)(R rhs, T bound)
    {
        throw new CheckFailure("Upper bound error: %s(%s) > %s(%s)", R.stringof, rhs, T.stringof, bound);
    }
    auto hookOpEquals(L, R)(L lhs, R rhs)
    {
        throw new CheckFailure("Erroneous comparison: %s(%s) == %s(%s)", L.stringof, lhs, R.stringof, rhs);
    }
    auto hookOpCmp(L, R)(L lhs, R rhs)
    {
        throw new CheckFailure("Erroneous ordering comparison: %s(%s) and %s(%s)", L.stringof, lhs, R.stringof, rhs);
    }
    typeof(~L()) onOverflow(string x, L)(L lhs)
    {
        throw new CheckFailure("Overflow on unary operator: %s%s(%s)", x, L.stringof, lhs);
    }
    typeof(L() + R()) onOverflow(string x, L, R)(L lhs, R rhs)
    {
        throw new CheckFailure("Overflow on binary operator: %s(%s) %s %s(%s)", L.stringof, lhs, x, R.stringof, rhs);
    }
}

struct Warn
{
static:
    Dst onBadCast(Dst, Src)(Src src)
    {
        stderr.writefln("Erroneous cast: cast(%s) %s(%s)", Dst.stringof, Src.stringof, src);
    }
    T onLowerBound(R, T)(R rhs, T bound)
    {
        stderr.writefln("Lower bound error: %s(%s) < %s(%s)", R.stringof, rhs, T.stringof, bound);
    }
    T onUpperBound(R, T)(R rhs, T bound)
    {
        stderr.writefln("Upper bound error: %s(%s) > %s(%s)", R.stringof, rhs, T.stringof, bound);
    }
    auto hookOpEquals(L, R)(L lhs, R rhs)
    {
        stderr.writefln("Erroneous comparison: %s(%s) == %s(%s)", L.stringof, lhs, R.stringof, rhs);
    }
    auto hookOpCmp(L, R)(L lhs, R rhs)
    {
        stderr.writefln("Erroneous ordering comparison: %s(%s) and %s(%s)", L.stringof, lhs, R.stringof, rhs);
    }
    typeof(~L()) onOverflow(string x, L)(L lhs)
    {
        stderr.writefln("Overflow on unary operator: %s%s(%s)", x, L.stringof, lhs);
    }
    typeof(L() + R()) onOverflow(string x, L, R)(L lhs, R rhs)
    {
        stderr.writefln("Overflow on binary operator: %s(%s) %s %s(%s)", L.stringof, lhs, x, R.stringof, rhs);
    }
}

void main()
{
    CheckedInt!(CheckedInt!(CheckedInt!(int, bool), bool), Warn) c;
    c = 3;
    c = c + 2;
    CheckedInt!(CheckedInt!(int, bool), Abort) c2;
    c2 = 2;
    c = c + c2;
    c += c2;
    writeln(c);
    c++;
    writeln(c);
    ++c;
    writeln(c);
    writeln(++c++);
    writeln(cast(long)c);
}