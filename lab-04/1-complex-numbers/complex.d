struct Complex
{
    double x;
    double y;

    void opAssign(Complex z)
    {
        this.x = z.x;
        this.y = z.y;
    }

    void opAssign(double value)
    {
        x = value;
        y = 0;
    }

    Complex opBinary(string op)(Complex z)
    if (op == "+" || op == "-" || op == "*" || op == "/")
    {
        Complex new_z = this;
        mixin("new_z " ~ op ~ "= z;");
        return new_z;
    }

    Complex opBinary(string op)(float x)
    if (op == "+" || op == "-" || op == "*" || op == "/")
    {
        Complex new_z = this;
        Complex z = x;
        mixin("new_z " ~ op ~ "= z;");
        return new_z;
    }

    ref Complex opOpAssign(string op)(Complex z)
    if (op == "+" || op == "-" || op == "*" || op == "/")
    {
        if (op == "+" || op == "-")
        {
            mixin("x " ~ op ~ "= z.x;");
            mixin("y " ~ op ~ "= z.y;");
        }
        else if (op == "*")
        {
            auto x = this.x * z.x - this.y * z.y;
            auto y = this.x * z.y + this.y * z.x;
            this.x = x;
            this.y = y;
        }
        else if (op == "/")
        {
            auto x = (this.x * z.x + this.y * z.y) / (z.x * z.x + z.y * z.y);
            auto y = (this.y * z.x - this.x * z.y) / (z.x * z.x + z.y * z.y);
            this.x = x;
            this.y = y;
        }
        return this;
    }

    ref Complex opOpAssign(string op)(float x)
    if (op == "+" || op == "-" || op == "*" || op == "/")
    {
        Complex z = x;
        mixin("this " ~ op ~ "= z;");
        return this;
    }

    this(float x, float y)
    {
        this.x = x;
        this.y = y;
    }

    this(float x)
    {
        this.x = x;
        y = 0.0;
    }
}

unittest
{
    Complex z1 = Complex(1.0);
    assert(z1.x == 1.0 && z1.y == 0.0);
    Complex z2 = Complex(2.0, 2.0);
    assert(z2.x == 2.0 && z2.y == 2.0);
    z1 = z2;
    assert(z1 == z2);
    assert(z1.x == 2.0 && z1.y == 2.0);
    z2 = 1.0;
    assert(z2.x == 1.0 && z2.y == 0.0);
    z2 = Complex(1.0, 1.0);
    z1 += z2;
    assert(z1.x == 3.0 && z1.y == 3.0);
    z1 -= z2;
    assert(z1.x == 2.0 && z1.y == 2.0);
    z1 *= z1;
    assert(z1.x == 0.0 && z1.y == 8.0);
    z2 /= z2;
    assert(z2.x == 1.0 && z2.y == 0.0);
    Complex z = Complex(2.0, 2.0);
    z = z + Complex(1.0, 1.0);
    assert(z.x == 3.0 && z.y == 3.0);
    z = z - Complex(1.0, 1.0);
    assert(z.x == 2.0 && z.y == 2.0);
    z = z * Complex(2.0, 2.0);
    assert(z.x == 0.0 && z.y == 8.0);
    z = z / Complex(2.0, 2.0);
    assert(z.x == 2.0 && z.y == 2.0);
    z += 2.0;
    assert(z.x == 4.0 && z.y == 2.0);
    z -= 2.0;
    assert(z.x == 2.0 && z.y == 2.0);
    z *= 2.0;
    assert(z.x == 4.0 && z.y == 4.0);
    z /= 2.0;
    assert(z.x == 2.0 && z.y == 2.0);
    z = z + 2.0;
    assert(z.x == 4.0 && z.y == 2.0);
    z = z - 2.0;
    assert(z.x == 2.0 && z.y == 2.0);
    z = z * 2.0;
    assert(z.x == 4.0 && z.y == 4.0);
    z = z / 2.0;
    assert(z.x == 2.0 && z.y == 2.0);
    z = 0.0;
    assert(z.x == 0.0 && z.y == 0.0);
}

void main()
{
}