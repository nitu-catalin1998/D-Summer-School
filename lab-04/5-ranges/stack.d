import std.range;

struct Stack(T)
{
    T[] stack;

    void push(T value)
    {
        stack ~= value;
    }

    void pop()
    {
        stack.length = stack.length - 1;
    }

    T top()
    {
        return stack[$ - 1];
    }

    bool empty()
    {
        return stack.length == 0;
    }

    T front()
    {
        return top();
    }

    void popFront()
    {
        pop();
    }

    Stack!(T) save()
    {
        return this;
    }

    T back()
    {
        Stack!(T) tmp_stack;
        while (!this.empty())
        {
            tmp_stack.push(this.front());
            this.pop();
        }
        T value = tmp_stack.front();
        while (!tmp_stack.empty())
        {
            this.push(tmp_stack.front());
            tmp_stack.pop();
        }
        return value;
    }

    void popBack()
    {
        Stack!(T) tmp_stack;
        while (!this.empty())
        {
            tmp_stack.push(this.front());
            this.pop();
        }
        T value = tmp_stack.front();
        tmp_stack.pop();
        while (!tmp_stack.empty())
        {
            this.push(tmp_stack.front());
            tmp_stack.pop();
        }
    }

    T opIndex(size_t index)
    {
        Stack!(T) tmp_stack;
        while (!this.empty() && index != 0)
        {
            tmp_stack.push(this.front());
            this.pop();
            index--;
        }
        T value = this.front();
        while (!tmp_stack.empty())
        {
            this.push(tmp_stack.front());
            tmp_stack.pop();
        }
        return value;
    }

    size_t length()
    {
        return stack.length;
    }
}

unittest
{
    Stack!(int) stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    assert(stack.empty() == false);
    assert(stack.top() == 3);
    stack.pop();
    assert(stack.top() == 2);
    stack.pop();
    assert(stack.top() == 1);
    stack.pop();
    assert(stack.empty() == true);
}

unittest
{
    static assert(isInputRange!(Stack!(int)));
    static assert(isForwardRange!(Stack!(int)));
    static assert(isBidirectionalRange!(Stack!(int)));
    static assert(isRandomAccessRange!(Stack!(int)));
}

unittest
{
    Stack!(int) stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    assert(stack.empty() == false);
    assert(stack.front() == 3);
    assert(stack.back() == 1);
    stack.popFront();
    assert(stack.front() == 2);
    assert(stack.back() == 1);
    stack.popFront();
    assert(stack.front() == 1);
    assert(stack.back() == 1);
    stack.popFront();
    assert(stack.empty() == true);
}

unittest
{
    Stack!(int) stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    assert(stack.empty() == false);
    assert(stack.front() == 3);
    assert(stack.back() == 1);
    stack.popBack();
    assert(stack.front() == 3);
    assert(stack.back() == 2);
    stack.popBack();
    assert(stack.front() == 3);
    assert(stack.back() == 3);
    stack.popBack();
    assert(stack.empty() == true);
}

unittest
{
    Stack!(int) stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    assert(stack.empty() == false);
    assert(stack.front() == 3);
    assert(stack.back() == 1);
    stack.popBack();
    assert(stack.front() == 3);
    assert(stack.back() == 2);
    stack.popFront();
    assert(stack.front() == 2);
    assert(stack.back() == 2);
    stack.popBack();
    assert(stack.empty() == true);
}

unittest
{
    Stack!(int) stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    assert(stack.empty() == false);
    assert(stack.front() == 3);
    assert(stack.back() == 1);
    stack.popFront();
    assert(stack.front() == 2);
    assert(stack.back() == 1);
    stack.popBack();
    assert(stack.front() == 2);
    assert(stack.back() == 2);
    stack.popFront();
    assert(stack.empty() == true);
}

unittest
{
    Stack!(int) stack;
    stack.push(1);
    stack.push(2);
    stack.push(3);
    int i = 3;
    foreach (int e; stack)
    {
        assert(i == e);
        i--;
    }
    foreach_reverse (int e; stack)
    {
        i++;
        assert(i == e);
    }
    assert(stack[0] == 3);
    assert(stack[1] == 2);
    assert(stack[2] == 1);
}

void main()
{
}