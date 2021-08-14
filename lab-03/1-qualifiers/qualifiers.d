struct A
{
    int[10] b;
}
void munA(A) {}
void cunA(const A) {}
void iunA(immutable A) {}

struct B
{
    int[] c;
}
void munB(const B) {}
void cunB(const B) {}
void iunB(immutable B) {}

class C
{
    int[10] a;
}
void munC(const C) {}
void cunC(const C) {}
void iunC(immutable C) {}

class D
{
    int[] a;
}
void munD(const D) {}
void cunD(const D) {}
void iunD(immutable D) {}

void main()
{
    /*******************************************
     * value type without indirections is convertible any to any
     */
    A a;
    const A ca;
    immutable A ia;
    munA(a);
    munA(ca);
    munA(ia);

    /******************************************
     * value type with indirections must obey qualifier conversion rules
     */
    immutable B b;
    immutable B cb;
    immutable B ib;
    munB(b);
    munB(cb);
    munB(ib);

    cunB(b);
    cunB(cb);
    cunB(ib);

    iunB(b);
    iunB(cb);
    iunB(ib);

    /********************************************
     * reference types must obey qualifier conversion rules
     */
    immutable C c;
    immutable C cc;
    immutable C ic;
    munC(c);
    munC(cc);
    munC(ic);

    cunC(c);
    cunC(cc);
    cunC(ic);

    iunC(c);
    iunC(cc);
    iunC(ic);

    /*******************************************
     * reference types must obey qualifier conversion rules
     */
    immutable D d;
    immutable D cd;
    immutable D id;
    munD(d);
    munD(cd);
    munD(id);

    cunD(d);
    cunD(cd);
    cunD(id);

    iunD(d);
    iunD(cd);
    iunD(id);
}