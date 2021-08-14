int example.sum(int, int):
        push    rbp
        mov     rbp, rsp
        mov     dword ptr [rbp - 4], esi
        mov     dword ptr [rbp - 8], edi
        mov     eax, dword ptr [rbp - 4]
        add     eax, dword ptr [rbp - 8]
        pop     rbp
        ret

_Dmain:
        push    rbp
        mov     rbp, rsp
        mov     edi, 12
        call    @safe void std.stdio.writeln!(int).writeln(int)@PLT
        xor     eax, eax
        pop     rbp
        ret

@safe void std.stdio.writeln!(int).writeln(int):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     dword ptr [rbp - 4], edi
        lea     rax, [rbp - 32]
        mov     rdi, rax
        mov     qword ptr [rbp - 56], rax
        call    @property @trusted std.stdio.File std.stdio.trustedStdout()@PLT
        mov     edx, dword ptr [rbp - 4]
        mov     esi, 10
        mov     rdi, qword ptr [rbp - 56]
        call    @safe void std.stdio.File.write!(int, char).write(int, char)@PLT
        jmp     .LBB2_1
.LBB2_1:
        mov     dword ptr [rbp - 48], 1
        jmp     .LBB2_3
.LBB2_2:
        add     rsp, 64
        pop     rbp
        ret
.LBB2_3:
        lea     rdi, [rbp - 32]
        call    @safe void std.stdio.File.__dtor()@PLT
        mov     eax, dword ptr [rbp - 48]
        sub     eax, 1
        je      .LBB2_2
        jmp     .LBB2_5
        mov     qword ptr [rbp - 40], rax
        mov     dword ptr [rbp - 44], edx
        mov     dword ptr [rbp - 48], 0
        jmp     .LBB2_3
.LBB2_5:
        mov     rdi, qword ptr [rbp - 40]
        call    _Unwind_Resume@PLT

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     rax, qword ptr [rip + _Dmain@GOTPCREL]
        mov     dword ptr [rbp - 4], edi
        mov     qword ptr [rbp - 16], rsi
        mov     edi, dword ptr [rbp - 4]
        mov     rsi, qword ptr [rbp - 16]
        mov     rdx, rax
        call    _d_run_main@PLT
        add     rsp, 16
        pop     rbp
        ret

@safe void std.stdio.File.write!(int, char).write(int, char):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 160
        mov     dword ptr [rbp - 4], edx
        mov     byte ptr [rbp - 5], sil
        lea     rax, [rbp - 56]
        mov     qword ptr [rbp - 144], rdi
        mov     rdi, rax
        mov     rsi, qword ptr [rbp - 144]
        call    @safe std.stdio.File.LockingTextWriter std.stdio.File.lockingTextWriter()@PLT
        mov     eax, dword ptr [rbp - 4]
        mov     dword ptr [rbp - 60], eax
        mov     esi, dword ptr [rbp - 60]
        movups  xmm0, xmmword ptr [rbp - 56]
        movups  xmm1, xmmword ptr [rbp - 40]
        movups  xmm2, xmmword ptr [rbp - 24]
        movaps  xmmword ptr [rbp - 80], xmm2
        movaps  xmmword ptr [rbp - 96], xmm1
        movaps  xmmword ptr [rbp - 112], xmm0
        lea     rdi, [rbp - 112]
        mov     dword ptr [rbp - 148], esi
        call    @trusted void std.stdio.File.LockingTextWriter.__aggrPostblit()@PLT
        jmp     .LBB4_2
.LBB4_2:
        lea     rdi, [rbp - 112]
        mov     esi, dword ptr [rbp - 148]
        call    @safe void std.conv.toTextRange!(int, std.stdio.File.LockingTextWriter).toTextRange(int, std.stdio.File.LockingTextWriter)@PLT
        jmp     .LBB4_3
.LBB4_3:
        jmp     .LBB4_4
.LBB4_4:
        mov     al, byte ptr [rbp - 5]
        mov     byte ptr [rbp - 125], al
        movzx   edi, byte ptr [rbp - 125]
        lea     rsi, [rbp - 56]
        call    @safe void std.range.primitives.put!(std.stdio.File.LockingTextWriter, char).put(ref std.stdio.File.LockingTextWriter, char)@PLT
        jmp     .LBB4_5
.LBB4_5:
        jmp     .LBB4_6
.LBB4_6:
        mov     dword ptr [rbp - 132], 1
.LBB4_7:
        lea     rdi, [rbp - 56]
        call    @trusted void std.stdio.File.LockingTextWriter.__aggrDtor()@PLT
        mov     eax, dword ptr [rbp - 132]
        sub     eax, 1
        jne     .LBB4_10
        jmp     .LBB4_8
.LBB4_8:
        add     rsp, 160
        pop     rbp
        ret
        mov     qword ptr [rbp - 120], rax
        mov     dword ptr [rbp - 124], edx
        mov     dword ptr [rbp - 132], 0
        jmp     .LBB4_7
.LBB4_10:
        mov     rdi, qword ptr [rbp - 120]
        call    _Unwind_Resume@PLT

@safe void std.conv.toTextRange!(int, std.stdio.File.LockingTextWriter).toTextRange(int, std.stdio.File.LockingTextWriter):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     dword ptr [rbp - 4], esi
        cmp     dword ptr [rbp - 4], 0
        mov     qword ptr [rbp - 72], rdi
        jge     .LBB5_3
        movsxd  rdx, dword ptr [rbp - 4]
        mov     edi, 20
        lea     rsi, [rbp - 24]
        call    pure nothrow @nogc @safe char[] core.internal.string.signedToTempString!(10u).signedToTempString(long, scope return char[])@PLT
        mov     rdi, rax
        mov     rsi, rdx
        mov     rdx, qword ptr [rbp - 72]
        call    @safe void std.range.primitives.put!(std.stdio.File.LockingTextWriter, char[]).put(ref std.stdio.File.LockingTextWriter, char[])@PLT
        jmp     .LBB5_2
.LBB5_2:
        jmp     .LBB5_5
.LBB5_3:
        movsxd  rdx, dword ptr [rbp - 4]
        mov     edi, 20
        lea     rsi, [rbp - 56]
        call    pure nothrow @nogc @safe char[] core.internal.string.unsignedToTempString!(10u).unsignedToTempString(ulong, scope return char[])@PLT
        mov     rdi, rax
        mov     rsi, rdx
        mov     rdx, qword ptr [rbp - 72]
        call    @safe void std.range.primitives.put!(std.stdio.File.LockingTextWriter, char[]).put(ref std.stdio.File.LockingTextWriter, char[])@PLT
        jmp     .LBB5_4
.LBB5_4:
        jmp     .LBB5_5
.LBB5_5:
        mov     dword ptr [rbp - 60], 1
.LBB5_6:
        mov     rdi, qword ptr [rbp - 72]
        call    @trusted void std.stdio.File.LockingTextWriter.__aggrDtor()@PLT
        mov     eax, dword ptr [rbp - 60]
        sub     eax, 1
        jne     .LBB5_9
        jmp     .LBB5_7
.LBB5_7:
        add     rsp, 80
        pop     rbp
        ret
        mov     qword ptr [rbp - 32], rax
        mov     dword ptr [rbp - 36], edx
        mov     dword ptr [rbp - 60], 0
        jmp     .LBB5_6
.LBB5_9:
        mov     rdi, qword ptr [rbp - 32]
        call    _Unwind_Resume@PLT

@safe void std.range.primitives.put!(std.stdio.File.LockingTextWriter, char).put(ref std.stdio.File.LockingTextWriter, char):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     byte ptr [rbp - 1], dil
        lea     rdi, [rbp - 1]
        call    @safe void std.range.primitives.doPut!(std.stdio.File.LockingTextWriter, char).doPut(ref std.stdio.File.LockingTextWriter, ref char)@PLT
        add     rsp, 16
        pop     rbp
        ret

@safe void std.range.primitives.doPut!(std.stdio.File.LockingTextWriter, char).doPut(ref std.stdio.File.LockingTextWriter, ref char):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword ptr [rbp - 8], rdi
        mov     rdi, rsi
        mov     rax, qword ptr [rbp - 8]
        movzx   esi, byte ptr [rax]
        call    @safe void std.stdio.File.LockingTextWriter.put!(char).put(char)@PLT
        add     rsp, 16
        pop     rbp
        ret

@safe void std.stdio.File.LockingTextWriter.put!(char).put(char):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 144
        mov     byte ptr [rbp - 1], sil
        mov     qword ptr [rbp - 80], rdi
        call    @safe void std.stdio.File.LockingTextWriter.highSurrogateShouldBeEmpty()@PLT
        mov     rax, qword ptr [rbp - 80]
        cmp     dword ptr [rax + 24], 0
        jg      .LBB8_2
        movzx   esi, byte ptr [rbp - 1]
        mov     rdi, qword ptr [rbp - 80]
        mov     dword ptr [rbp - 84], esi
        call    @property @trusted core.stdc.stdio._IO_FILE* std.stdio.File.LockingTextWriter.handle_()@PLT
        mov     rdi, rax
        mov     esi, dword ptr [rbp - 84]
        call    nothrow @nogc @trusted int std.stdio.File.LockingTextWriter.put!(char).put(char).trustedFPUTC(int, core.stdc.stdio._IO_FILE*)@PLT
        jmp     .LBB8_24
.LBB8_2:
        movzx   eax, byte ptr [rbp - 1]
        cmp     eax, 127
        jg      .LBB8_4
        movzx   esi, byte ptr [rbp - 1]
        mov     rdi, qword ptr [rbp - 80]
        mov     dword ptr [rbp - 88], esi
        call    @property @trusted core.stdc.stdio._IO_FILE* std.stdio.File.LockingTextWriter.handle_()@PLT
        mov     rdi, rax
        mov     esi, dword ptr [rbp - 88]
        call    nothrow @nogc @trusted int std.stdio.File.LockingTextWriter.put!(char).put(char).trustedFPUTWC(dchar, core.stdc.stdio._IO_FILE*)@PLT
        jmp     .LBB8_23
.LBB8_4:
        movzx   eax, byte ptr [rbp - 1]
        cmp     eax, 192
        jl      .LBB8_6
        mov     al, byte ptr [rbp - 1]
        mov     rcx, qword ptr [rbp - 80]
        mov     byte ptr [rcx + 30], al
        mov     qword ptr [rcx + 40], 1
        jmp     .LBB8_22
.LBB8_6:
        mov     rax, qword ptr [rbp - 80]
        add     rax, 30
        mov     rcx, qword ptr [rbp - 80]
        add     rcx, 40
        mov     rdx, qword ptr [rbp - 80]
        cmp     qword ptr [rdx + 40], 4
        mov     qword ptr [rbp - 96], rax
        mov     qword ptr [rbp - 104], rcx
        jae     .LBB8_21
        mov     rax, qword ptr [rbp - 104]
        mov     rcx, qword ptr [rax]
        mov     dl, byte ptr [rbp - 1]
        mov     rsi, qword ptr [rbp - 96]
        mov     byte ptr [rsi + rcx], dl
        mov     rcx, qword ptr [rbp - 80]
        mov     rdi, qword ptr [rcx + 40]
        add     rdi, 1
        mov     qword ptr [rcx + 40], rdi
        add     rcx, 30
        mov     edi, 4
        mov     rsi, rcx
        call    pure @safe uint std.utf.stride!(char[]).stride(char[])@PLT
        mov     eax, eax
        mov     ecx, eax
        mov     rsi, qword ptr [rbp - 80]
        cmp     rcx, qword ptr [rsi + 40]
        jne     .LBB8_20
        mov     rax, qword ptr [rbp - 80]
        add     rax, 30
        mov     rcx, qword ptr [rbp - 80]
        mov     rdx, qword ptr [rcx + 40]
        cmp     rdx, 4
        mov     qword ptr [rbp - 112], rax
        mov     qword ptr [rbp - 120], rdx
        ja      .LBB8_19
        mov     rax, qword ptr [rbp - 112]
        mov     rcx, qword ptr [rbp - 120]
        sub     rcx, 0
        mov     qword ptr [rbp - 24], rcx
        mov     qword ptr [rbp - 16], rax
        lea     rdi, [rbp - 24]
        call    pure @safe dchar std.utf.decodeFront!(0, char[]).decodeFront(ref char[])@PLT
        mov     dword ptr [rbp - 28], eax
        lea     rcx, [rbp - 32]
        mov     qword ptr [rbp - 40], 0
        mov     qword ptr [rbp - 128], rcx
.LBB8_10:
        cmp     qword ptr [rbp - 40], 1
        je      .LBB8_12
        mov     rax, qword ptr [rbp - 40]
        mov     rcx, qword ptr [rbp - 128]
        mov     dword ptr [rcx + 4*rax], 65535
        add     rax, 1
        mov     qword ptr [rbp - 40], rax
        jmp     .LBB8_10
.LBB8_12:
        mov     edi, dword ptr [rbp - 28]
        lea     rsi, [rbp - 32]
        call    pure @safe ulong std.utf.encode!(0).encode(out dchar[1], dchar)@PLT
        mov     qword ptr [rbp - 48], rax
        mov     qword ptr [rbp - 56], 0
        mov     rax, qword ptr [rbp - 48]
        mov     qword ptr [rbp - 64], rax
.LBB8_13:
        mov     rax, qword ptr [rbp - 56]
        cmp     rax, qword ptr [rbp - 64]
        jae     .LBB8_18
        mov     rax, qword ptr [rbp - 56]
        mov     qword ptr [rbp - 72], rax
        cmp     qword ptr [rbp - 72], 1
        jae     .LBB8_16
        mov     rax, qword ptr [rbp - 72]
        mov     esi, dword ptr [rbp + 4*rax - 32]
        mov     rdi, qword ptr [rbp - 80]
        mov     dword ptr [rbp - 132], esi
        call    @property @trusted core.stdc.stdio._IO_FILE* std.stdio.File.LockingTextWriter.handle_()@PLT
        mov     rdi, rax
        mov     esi, dword ptr [rbp - 132]
        call    nothrow @nogc @trusted int std.stdio.File.LockingTextWriter.put!(char).put(char).trustedFPUTWC(dchar, core.stdc.stdio._IO_FILE*)@PLT
        jmp     .LBB8_17
.LBB8_16:
        lea     rsi, [rip + .L.str]
        mov     edi, 66
        mov     edx, 3156
        call    _d_arraybounds@PLT
.LBB8_17:
        mov     rax, qword ptr [rbp - 56]
        add     rax, 1
        mov     qword ptr [rbp - 56], rax
        jmp     .LBB8_13
.LBB8_18:
        mov     rax, qword ptr [rbp - 80]
        mov     qword ptr [rax + 40], 0
        jmp     .LBB8_20
.LBB8_19:
        lea     rsi, [rip + .L.str]
        mov     edi, 66
        mov     edx, 3151
        call    _d_arraybounds@PLT
.LBB8_20:
        jmp     .LBB8_22
.LBB8_21:
        lea     rsi, [rip + .L.str]
        mov     edi, 66
        mov     edx, 3147
        call    _d_arraybounds@PLT
.LBB8_22:
        jmp     .LBB8_23
.LBB8_23:
        jmp     .LBB8_24
.LBB8_24:
        add     rsp, 144
        pop     rbp
        ret

nothrow @nogc @trusted int std.stdio.File.LockingTextWriter.put!(char).put(char).trustedFPUTC(int, core.stdc.stdio._IO_FILE*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword ptr [rbp - 4], esi
        mov     qword ptr [rbp - 16], rdi
        mov     edi, dword ptr [rbp - 4]
        mov     rsi, qword ptr [rbp - 16]
        call    fputc_unlocked@PLT
        add     rsp, 16
        pop     rbp
        ret

nothrow @nogc @trusted int std.stdio.File.LockingTextWriter.put!(char).put(char).trustedFPUTWC(dchar, core.stdc.stdio._IO_FILE*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword ptr [rbp - 4], esi
        mov     qword ptr [rbp - 16], rdi
        mov     edi, dword ptr [rbp - 4]
        mov     rsi, qword ptr [rbp - 16]
        call    fputwc_unlocked@PLT
        add     rsp, 16
        pop     rbp
        ret

pure @safe uint std.utf.stride!(char[]).stride(char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        xor     eax, eax
        mov     ecx, eax
        mov     qword ptr [rbp - 16], rdi
        mov     qword ptr [rbp - 8], rsi
        cmp     rcx, qword ptr [rbp - 16]
        jae     .LBB11_4
        mov     rax, qword ptr [rbp - 8]
        mov     cl, byte ptr [rax]
        mov     byte ptr [rbp - 17], cl
        movzx   edx, byte ptr [rbp - 17]
        cmp     edx, 128
        jge     .LBB11_3
        mov     eax, 1
        add     rsp, 32
        pop     rbp
        ret
.LBB11_3:
        xor     eax, eax
        mov     edi, eax
        movzx   esi, byte ptr [rbp - 17]
        call    pure @trusted uint std.utf.strideImpl(char, ulong)@PLT
        add     rsp, 32
        pop     rbp
        ret
.LBB11_4:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 354
        call    _d_arraybounds@PLT

pure @safe dchar std.utf.decodeFront!(0, char[]).decodeFront(ref char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword ptr [rbp - 8], 0
        lea     rax, [rbp - 8]
        mov     qword ptr [rbp - 16], rdi
        mov     rdi, rax
        mov     rsi, qword ptr [rbp - 16]
        call    pure @trusted dchar std.utf.decodeFront!(0, char[]).decodeFront(ref char[], out ulong)@PLT
        add     rsp, 16
        pop     rbp
        ret

pure @safe ulong std.utf.encode!(0).encode(out dchar[1], dchar):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     dword ptr [rbp - 4], edi
        mov     rax, rsi
        mov     qword ptr [rbp - 16], 0
        mov     qword ptr [rbp - 24], rsi
        mov     qword ptr [rbp - 32], rax
.LBB13_1:
        cmp     qword ptr [rbp - 16], 1
        je      .LBB13_3
        mov     rax, qword ptr [rbp - 16]
        mov     rcx, qword ptr [rbp - 32]
        mov     dword ptr [rcx + 4*rax], 65535
        add     rax, 1
        mov     qword ptr [rbp - 16], rax
        jmp     .LBB13_1
.LBB13_3:
        xor     eax, eax
        mov     ecx, 55296
        cmp     ecx, dword ptr [rbp - 4]
        mov     byte ptr [rbp - 33], al
        ja      .LBB13_5
        cmp     dword ptr [rbp - 4], 57343
        setbe   al
        mov     byte ptr [rbp - 33], al
.LBB13_5:
        mov     al, byte ptr [rbp - 33]
        test    al, 1
        mov     al, 1
        mov     byte ptr [rbp - 34], al
        jne     .LBB13_7
        mov     eax, 1114111
        cmp     eax, dword ptr [rbp - 4]
        setb    cl
        mov     byte ptr [rbp - 34], cl
.LBB13_7:
        mov     al, byte ptr [rbp - 34]
        test    al, 1
        jne     .LBB13_8
        jmp     .LBB13_9
.LBB13_8:
        mov     edi, dword ptr [rbp - 4]
        lea     rdx, [rip + .L.str.4]
        mov     esi, 40
        call    pure @safe dchar std.utf._utfException!(0)._utfException(immutable(char)[], dchar)@PLT
        mov     dword ptr [rbp - 4], eax
        jmp     .LBB13_12
.LBB13_9:
        mov     edi, dword ptr [rbp - 4]
        call    pure nothrow @nogc @safe bool std.utf.isValidDchar(dchar)@PLT
        test    al, 1
        jne     .LBB13_10
        jmp     .LBB13_11
.LBB13_10:
        jmp     .LBB13_12
.LBB13_11:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 2457
        call    _d_assert@PLT
.LBB13_12:
        mov     eax, dword ptr [rbp - 4]
        mov     rcx, qword ptr [rbp - 24]
        mov     dword ptr [rcx], eax
        mov     eax, 1
        add     rsp, 48
        pop     rbp
        ret

pure nothrow @property @nogc @safe bool std.range.primitives.empty!(char[]).empty(scope ref char[]):
        push    rbp
        mov     rbp, rsp
        mov     rax, qword ptr [rdi]
        test    rax, rax
        sete    cl
        and     cl, 1
        movzx   eax, cl
        pop     rbp
        ret

pure @trusted dchar std.utf.decodeFront!(0, char[]).decodeFront(ref char[], out ulong):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword ptr [rdi], 0
        mov     qword ptr [rbp - 32], rdi
        mov     rdi, rsi
        mov     qword ptr [rbp - 40], rsi
        call    pure nothrow @property @nogc @safe bool std.range.primitives.empty!(char[]).empty(scope ref char[])@PLT
        mov     cl, al
        test    al, al
        jne     .LBB15_15
        jmp     .LBB15_1
.LBB15_1:
        xor     eax, eax
        mov     ecx, eax
        mov     rdx, qword ptr [rbp - 40]
        cmp     rcx, qword ptr [rdx]
        jae     .LBB15_14
        mov     rax, qword ptr [rbp - 40]
        mov     rcx, qword ptr [rax + 8]
        movzx   edx, byte ptr [rcx]
        cmp     edx, 128
        jge     .LBB15_8
        xor     eax, eax
        mov     ecx, eax
        mov     rdx, qword ptr [rbp - 32]
        mov     qword ptr [rdx], 1
        mov     rsi, qword ptr [rbp - 40]
        cmp     rcx, qword ptr [rsi]
        jae     .LBB15_7
        mov     rax, qword ptr [rbp - 40]
        mov     rcx, qword ptr [rax + 8]
        mov     dl, byte ptr [rcx]
        mov     byte ptr [rbp - 5], dl
        mov     rcx, qword ptr [rax]
        mov     esi, 1
        cmp     rsi, rcx
        mov     qword ptr [rbp - 48], rcx
        ja      .LBB15_6
        mov     rax, qword ptr [rbp - 40]
        mov     rcx, qword ptr [rax + 8]
        add     rcx, 1
        mov     rdx, qword ptr [rbp - 48]
        sub     rdx, 1
        mov     qword ptr [rax], rdx
        mov     qword ptr [rax + 8], rcx
        movzx   esi, byte ptr [rbp - 5]
        mov     dword ptr [rbp - 4], esi
        jmp     .LBB15_11
.LBB15_6:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1244
        call    _d_arraybounds@PLT
.LBB15_7:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1243
        call    _d_arraybounds@PLT
.LBB15_8:
        mov     rax, qword ptr [rbp - 40]
        mov     rsi, qword ptr [rax]
        mov     rdx, qword ptr [rax + 8]
        mov     rdi, qword ptr [rbp - 32]
        call    pure dchar std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong)@PLT
        mov     dword ptr [rbp - 12], eax
        mov     rcx, qword ptr [rbp - 32]
        mov     rdx, qword ptr [rcx]
        mov     rsi, qword ptr [rbp - 40]
        mov     rdi, qword ptr [rsi]
        cmp     rdx, rdi
        mov     qword ptr [rbp - 56], rdx
        mov     qword ptr [rbp - 64], rdi
        ja      .LBB15_10
        mov     rax, qword ptr [rbp - 56]
        mov     rcx, qword ptr [rbp - 40]
        add     rax, qword ptr [rcx + 8]
        mov     rdx, qword ptr [rbp - 64]
        mov     rsi, qword ptr [rbp - 56]
        sub     rdx, rsi
        mov     qword ptr [rcx], rdx
        mov     qword ptr [rcx + 8], rax
        mov     edi, dword ptr [rbp - 12]
        mov     dword ptr [rbp - 4], edi
        jmp     .LBB15_11
.LBB15_10:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1250
        call    _d_arraybounds@PLT
.LBB15_11:
        lea     rax, [rbp - 4]
        mov     qword ptr [rbp - 24], rax
        mov     rax, qword ptr [rbp - 24]
        mov     edi, dword ptr [rax]
        call    pure nothrow @nogc @safe bool std.utf.isValidDchar(dchar)@PLT
        test    al, 1
        jne     .LBB15_12
        jmp     .LBB15_13
.LBB15_12:
        mov     eax, dword ptr [rbp - 4]
        add     rsp, 64
        pop     rbp
        ret
.LBB15_13:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1236
        call    _d_assert@PLT
.LBB15_14:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1240
        call    _d_arraybounds@PLT
.LBB15_15:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1232
        call    _d_assert@PLT

pure dchar std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        lea     rax, [rbp - 32]
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 8], rdx
        mov     rcx, rax
        add     rcx, 8
        mov     rdx, qword ptr [rbp - 8]
        add     rdx, qword ptr [rdi]
        mov     qword ptr [rbp - 32], rdx
        mov     rdx, qword ptr [rbp - 16]
        sub     rdx, qword ptr [rdi]
        mov     qword ptr [rbp - 24], rdx
        mov     rdx, qword ptr [rbp - 32]
        mov     r8b, byte ptr [rdx]
        mov     byte ptr [rbp - 33], r8b
        movzx   r9d, byte ptr [rbp - 33]
        and     r9d, 192
        cmp     r9d, 192
        mov     qword ptr [rbp - 48], rdi
        mov     qword ptr [rbp - 56], rax
        mov     qword ptr [rbp - 64], rcx
        je      .LBB16_2
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_2:
        movzx   eax, byte ptr [rbp - 33]
        mov     dword ptr [rbp - 40], eax
        mov     cl, byte ptr [rbp - 33]
        mov     eax, 1
        mov     byte ptr [rbp - 65], cl
        mov     cl, al
        mov     al, byte ptr [rbp - 65]
        shl     al, cl
        mov     byte ptr [rbp - 33], al
        mov     eax, 1
        mov     rcx, qword ptr [rbp - 64]
        cmp     rax, qword ptr [rcx]
        jne     .LBB16_5
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).outOfBounds()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_5:
        mov     rax, qword ptr [rbp - 56]
        mov     rcx, qword ptr [rax]
        mov     dl, byte ptr [rcx + 1]
        mov     byte ptr [rbp - 34], dl
        movzx   esi, byte ptr [rbp - 34]
        and     esi, 192
        cmp     esi, 128
        je      .LBB16_7
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_7:
        mov     eax, dword ptr [rbp - 40]
        shl     eax, 6
        movzx   ecx, byte ptr [rbp - 34]
        and     ecx, 63
        or      eax, ecx
        mov     dword ptr [rbp - 40], eax
        mov     dl, byte ptr [rbp - 33]
        add     dl, dl
        mov     byte ptr [rbp - 33], dl
        movzx   eax, byte ptr [rbp - 33]
        shr     eax, 7
        mov     dl, al
        test    eax, eax
        jne     .LBB16_11
        jmp     .LBB16_8
.LBB16_8:
        mov     eax, dword ptr [rbp - 40]
        and     eax, 2047
        mov     dword ptr [rbp - 40], eax
        mov     eax, dword ptr [rbp - 40]
        and     eax, -128
        cmp     eax, 0
        jne     .LBB16_10
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_10:
        mov     rax, qword ptr [rbp - 48]
        mov     rcx, qword ptr [rax]
        add     rcx, 2
        mov     qword ptr [rax], rcx
        mov     edx, dword ptr [rbp - 40]
        mov     eax, edx
        add     rsp, 80
        pop     rbp
        ret
.LBB16_11:
        jmp     .LBB16_12
.LBB16_12:
        mov     eax, 2
        mov     rcx, qword ptr [rbp - 64]
        cmp     rax, qword ptr [rcx]
        jne     .LBB16_14
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).outOfBounds()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_14:
        mov     rax, qword ptr [rbp - 56]
        mov     rcx, qword ptr [rax]
        mov     dl, byte ptr [rcx + 2]
        mov     byte ptr [rbp - 34], dl
        movzx   esi, byte ptr [rbp - 34]
        and     esi, 192
        cmp     esi, 128
        je      .LBB16_16
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_16:
        mov     eax, dword ptr [rbp - 40]
        shl     eax, 6
        movzx   ecx, byte ptr [rbp - 34]
        and     ecx, 63
        or      eax, ecx
        mov     dword ptr [rbp - 40], eax
        mov     dl, byte ptr [rbp - 33]
        add     dl, dl
        mov     byte ptr [rbp - 33], dl
        movzx   eax, byte ptr [rbp - 33]
        shr     eax, 7
        mov     dl, al
        test    eax, eax
        jne     .LBB16_22
        jmp     .LBB16_17
.LBB16_17:
        mov     eax, dword ptr [rbp - 40]
        and     eax, 65535
        mov     dword ptr [rbp - 40], eax
        mov     eax, dword ptr [rbp - 40]
        and     eax, -2048
        cmp     eax, 0
        jne     .LBB16_19
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_19:
        mov     edi, dword ptr [rbp - 40]
        call    pure nothrow @nogc @safe bool std.utf.isValidDchar(dchar)@PLT
        mov     cl, al
        test    al, al
        jne     .LBB16_21
        jmp     .LBB16_20
.LBB16_20:
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_21:
        mov     rax, qword ptr [rbp - 48]
        mov     rcx, qword ptr [rax]
        add     rcx, 3
        mov     qword ptr [rax], rcx
        mov     edx, dword ptr [rbp - 40]
        mov     eax, edx
        add     rsp, 80
        pop     rbp
        ret
.LBB16_22:
        jmp     .LBB16_23
.LBB16_23:
        mov     eax, 3
        mov     rcx, qword ptr [rbp - 64]
        cmp     rax, qword ptr [rcx]
        jne     .LBB16_25
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).outOfBounds()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_25:
        mov     rax, qword ptr [rbp - 56]
        mov     rcx, qword ptr [rax]
        mov     dl, byte ptr [rcx + 3]
        mov     byte ptr [rbp - 34], dl
        movzx   esi, byte ptr [rbp - 34]
        and     esi, 192
        cmp     esi, 128
        je      .LBB16_27
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_27:
        mov     eax, dword ptr [rbp - 40]
        shl     eax, 6
        movzx   ecx, byte ptr [rbp - 34]
        and     ecx, 63
        or      eax, ecx
        mov     dword ptr [rbp - 40], eax
        mov     dl, byte ptr [rbp - 33]
        add     dl, dl
        mov     byte ptr [rbp - 33], dl
        movzx   eax, byte ptr [rbp - 33]
        shr     eax, 7
        mov     dl, al
        test    eax, eax
        jne     .LBB16_33
        jmp     .LBB16_28
.LBB16_28:
        mov     eax, dword ptr [rbp - 40]
        and     eax, 2097151
        mov     dword ptr [rbp - 40], eax
        mov     eax, dword ptr [rbp - 40]
        and     eax, -65536
        cmp     eax, 0
        jne     .LBB16_30
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_30:
        mov     rax, qword ptr [rbp - 48]
        mov     rcx, qword ptr [rax]
        add     rcx, 4
        mov     qword ptr [rax], rcx
        cmp     dword ptr [rbp - 40], 1114111
        jbe     .LBB16_32
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT
.LBB16_32:
        mov     eax, dword ptr [rbp - 40]
        add     rsp, 80
        pop     rbp
        ret
.LBB16_33:
        jmp     .LBB16_34
.LBB16_34:
        lea     rax, [rbp - 32]
        mov     rdi, rax
        call    pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF()@PLT
        mov     rdi, rax
        call    _d_throw_exception@PLT

pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).invalidUTF():
        push    rbp
        mov     rbp, rsp
        mov     rcx, qword ptr [rdi]
        mov     rdx, qword ptr [rdi + 8]
        lea     rsi, [rip + .L.str.2]
        mov     edi, 22
        call    pure nothrow @safe std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).exception!(const(char)[]).exception(const(char)[], immutable(char)[])@PLT
        pop     rbp
        ret

pure nothrow @safe std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).exception!(const(char)[]).exception(const(char)[], immutable(char)[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 144
        mov     qword ptr [rbp - 16], rdx
        mov     qword ptr [rbp - 8], rcx
        mov     qword ptr [rbp - 24], rsi
        mov     qword ptr [rbp - 32], rdi
        mov     qword ptr [rbp - 56], 0
.LBB18_1:
        cmp     qword ptr [rbp - 56], 4
        jae     .LBB18_5
        mov     rax, qword ptr [rbp - 56]
        shl     rax, 2
        lea     rcx, [rbp - 48]
        add     rcx, rax
        mov     rax, qword ptr [rbp - 56]
        cmp     rax, qword ptr [rbp - 16]
        mov     qword ptr [rbp - 64], rcx
        jae     .LBB18_4
        mov     rax, qword ptr [rbp - 8]
        mov     rcx, qword ptr [rbp - 56]
        movzx   edx, byte ptr [rax + rcx]
        mov     rax, qword ptr [rbp - 64]
        mov     dword ptr [rax], edx
        jmp     .LBB18_6
.LBB18_4:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1495
        call    _d_arraybounds@PLT
.LBB18_5:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1495
        call    _d_arraybounds@PLT
.LBB18_6:
        xor     eax, eax
        mov     rcx, qword ptr [rbp - 56]
        add     rcx, 1
        mov     qword ptr [rbp - 56], rcx
        mov     rcx, qword ptr [rbp - 16]
        cmp     qword ptr [rbp - 56], rcx
        mov     byte ptr [rbp - 65], al
        jae     .LBB18_8
        cmp     qword ptr [rbp - 56], 4
        setb    al
        mov     byte ptr [rbp - 65], al
.LBB18_8:
        mov     al, byte ptr [rbp - 65]
        xor     ecx, ecx
        test    al, 1
        mov     byte ptr [rbp - 66], cl
        jne     .LBB18_9
        jmp     .LBB18_12
.LBB18_9:
        mov     rax, qword ptr [rbp - 56]
        cmp     rax, qword ptr [rbp - 16]
        jae     .LBB18_11
        mov     rax, qword ptr [rbp - 8]
        mov     rcx, qword ptr [rbp - 56]
        movzx   edx, byte ptr [rax + rcx]
        and     edx, 192
        cmp     edx, 128
        sete    sil
        mov     byte ptr [rbp - 66], sil
        jmp     .LBB18_12
.LBB18_11:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1496
        call    _d_arraybounds@PLT
.LBB18_12:
        mov     al, byte ptr [rbp - 66]
        test    al, 1
        jne     .LBB18_1
        xor     eax, eax
        mov     ecx, eax
        mov     rdi, qword ptr [rip + std.utf.UTFException.__Class@GOTPCREL]
        mov     qword ptr [rbp - 80], rcx
        call    _d_allocclass@PLT
        mov     rcx, rax
        mov     rdx, rax
        mov     rsi, qword ptr [rip + std.utf.UTFException.__vtbl@GOTPCREL]
        mov     qword ptr [rax], rsi
        mov     qword ptr [rax + 8], 0
        mov     rsi, qword ptr [rip + std.utf.UTFException.__init@GOTPCREL]
        movups  xmm0, xmmword ptr [rsi + 96]
        movups  xmmword ptr [rax + 96], xmm0
        movups  xmm0, xmmword ptr [rsi + 80]
        movups  xmmword ptr [rax + 80], xmm0
        movups  xmm0, xmmword ptr [rsi + 16]
        movups  xmm1, xmmword ptr [rsi + 32]
        movups  xmm2, xmmword ptr [rsi + 48]
        movups  xmm3, xmmword ptr [rsi + 64]
        movups  xmmword ptr [rax + 64], xmm3
        movups  xmmword ptr [rax + 48], xmm2
        movups  xmmword ptr [rax + 32], xmm1
        movups  xmmword ptr [rax + 16], xmm0
        mov     rax, qword ptr [rbp - 32]
        mov     rsi, qword ptr [rbp - 24]
        mov     r9, qword ptr [rbp - 56]
        mov     rdi, rsp
        mov     qword ptr [rdi + 8], rsi
        mov     qword ptr [rdi], rax
        lea     r8, [rip + .L.str.1]
        xor     r10d, r10d
        mov     esi, r10d
        mov     eax, 1498
        mov     edi, 64
        mov     qword ptr [rbp - 88], rdi
        mov     rdi, rdx
        mov     qword ptr [rbp - 96], rdx
        mov     rdx, rax
        mov     rax, qword ptr [rbp - 88]
        mov     qword ptr [rbp - 104], rcx
        mov     rcx, rax
        call    pure nothrow @safe std.utf.UTFException std.utf.UTFException.__ctor(immutable(char)[], ulong, immutable(char)[], ulong, object.Throwable)@PLT
        mov     rcx, qword ptr [rbp - 104]
        mov     rdx, qword ptr [rcx]
        mov     rdx, qword ptr [rdx + 80]
        mov     rsi, qword ptr [rbp - 56]
        cmp     rsi, 4
        mov     qword ptr [rbp - 112], rdx
        mov     qword ptr [rbp - 120], rsi
        ja      .LBB18_15
        lea     rdx, [rbp - 48]
        mov     rax, qword ptr [rbp - 120]
        mov     rdi, qword ptr [rbp - 96]
        mov     rsi, rax
        mov     rax, qword ptr [rbp - 112]
        call    rax
        add     rsp, 144
        pop     rbp
        ret
.LBB18_15:
        lea     rsi, [rip + .L.str.1]
        mov     edi, 64
        mov     edx, 1498
        call    _d_arraybounds@PLT

pure nothrow std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).outOfBounds():
        push    rbp
        mov     rbp, rsp
        mov     rcx, qword ptr [rdi]
        mov     rdx, qword ptr [rdi + 8]
        lea     rsi, [rip + .L.str.3]
        mov     edi, 44
        call    pure nothrow @safe std.utf.UTFException std.utf.decodeImpl!(true, 0, const(char)[]).decodeImpl(const(char)[], ref ulong).exception!(const(char)[]).exception(const(char)[], immutable(char)[])@PLT
        pop     rbp
        ret

pure @safe dchar std.utf._utfException!(0)._utfException(immutable(char)[], dchar):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 120
        mov     qword ptr [rbp - 24], rsi
        mov     qword ptr [rbp - 16], rdx
        mov     dword ptr [rbp - 28], edi
        mov     rdi, qword ptr [rip + std.utf.UTFException.__Class@GOTPCREL]
        call    _d_allocclass@PLT
        mov     rcx, rax
        mov     rdx, qword ptr [rip + std.utf.UTFException.__vtbl@GOTPCREL]
        mov     qword ptr [rax], rdx
        mov     qword ptr [rax + 8], 0
        mov     rdx, qword ptr [rip + std.utf.UTFException.__init@GOTPCREL]
        movups  xmm0, xmmword ptr [rdx + 96]
        movups  xmmword ptr [rax + 96], xmm0
        movups  xmm0, xmmword ptr [rdx + 80]
        movups  xmmword ptr [rax + 80], xmm0
        movups  xmm0, xmmword ptr [rdx + 16]
        movups  xmm1, xmmword ptr [rdx + 32]
        movups  xmm2, xmmword ptr [rdx + 48]
        movups  xmm3, xmmword ptr [rdx + 64]
        movups  xmmword ptr [rax + 64], xmm3
        movups  xmmword ptr [rax + 48], xmm2
        movups  xmmword ptr [rax + 32], xmm1
        movups  xmmword ptr [rax + 16], xmm0
        movups  xmm0, xmmword ptr [rbp - 24]
        movaps  xmmword ptr [rbp - 48], xmm0
        movaps  xmm0, xmmword ptr [rbp - 48]
        mov     rdx, rsp
        movups  xmmword ptr [rdx], xmm0
        lea     r8, [rip + .L.str.1]
        xor     r9d, r9d
        mov     esi, r9d
        mov     edx, 2252
        mov     edi, 64
        mov     qword ptr [rbp - 64], rdi
        mov     rdi, rax
        mov     r10, qword ptr [rbp - 64]
        mov     qword ptr [rbp - 72], rcx
        mov     rcx, r10
        mov     qword ptr [rbp - 80], rax
        call    pure nothrow @nogc @safe std.utf.UTFException std.utf.UTFException.__ctor(immutable(char)[], immutable(char)[], ulong, object.Throwable)@PLT
        mov     rcx, qword ptr [rbp - 80]
        mov     rdx, qword ptr [rcx]
        mov     rdx, qword ptr [rdx + 80]
        mov     r9d, dword ptr [rbp - 28]
        mov     dword ptr [rbp - 52], r9d
        lea     rsi, [rbp - 52]
        mov     edi, 1
        mov     r8, qword ptr [rbp - 72]
        mov     qword ptr [rbp - 88], rdi
        mov     rdi, r8
        mov     r10, qword ptr [rbp - 88]
        mov     qword ptr [rbp - 96], rsi
        mov     rsi, r10
        mov     r11, qword ptr [rbp - 96]
        mov     qword ptr [rbp - 104], rdx
        mov     rdx, r11
        mov     rbx, qword ptr [rbp - 104]
        mov     qword ptr [rbp - 112], rax
        call    rbx
        mov     rdi, rax
        call    _d_throw_exception@PLT

@safe void std.range.primitives.put!(std.stdio.File.LockingTextWriter, char[]).put(ref std.stdio.File.LockingTextWriter, char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword ptr [rbp - 16], rdi
        mov     qword ptr [rbp - 8], rsi
        lea     rdi, [rbp - 16]
        mov     rsi, rdx
        call    @safe void std.range.primitives.doPut!(std.stdio.File.LockingTextWriter, char[]).doPut(ref std.stdio.File.LockingTextWriter, ref char[])@PLT
        add     rsp, 16
        pop     rbp
        ret

pure nothrow @nogc @safe char[] core.internal.string.signedToTempString!(10u).signedToTempString(long, scope return char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        lea     rax, [rbp - 40]
        mov     qword ptr [rbp - 8], rdx
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 24], rdi
        mov     rcx, qword ptr [rbp - 24]
        mov     qword ptr [rbp - 40], rcx
        mov     rcx, qword ptr [rbp - 16]
        mov     qword ptr [rbp - 32], rcx
        cmp     qword ptr [rbp - 8], 0
        setl    r8b
        and     r8b, 1
        mov     byte ptr [rbp - 41], r8b
        test    byte ptr [rbp - 41], 1
        mov     qword ptr [rbp - 72], rax
        je      .LBB22_2
        xor     eax, eax
        mov     ecx, eax
        sub     rcx, qword ptr [rbp - 8]
        mov     qword ptr [rbp - 8], rcx
.LBB22_2:
        mov     rdx, qword ptr [rbp - 8]
        mov     rax, qword ptr [rbp - 72]
        mov     rdi, qword ptr [rax]
        mov     rsi, qword ptr [rax + 8]
        call    pure nothrow @nogc @safe char[] core.internal.string.unsignedToTempString!(10u).unsignedToTempString(ulong, scope return char[])@PLT
        mov     qword ptr [rbp - 64], rax
        mov     qword ptr [rbp - 56], rdx
        test    byte ptr [rbp - 41], 1
        je      .LBB22_6
        lea     rdi, [rbp - 40]
        mov     rsi, qword ptr [rbp - 64]
        mov     rdx, qword ptr [rbp - 56]
        call    pure nothrow @nogc @trusted char[] core.internal.string.signedToTempString!(10u).signedToTempString(long, scope return char[]).trustedSlice(return char[])@PLT
        xor     ecx, ecx
        mov     esi, ecx
        mov     qword ptr [rbp - 64], rax
        mov     qword ptr [rbp - 56], rdx
        cmp     rsi, qword ptr [rbp - 64]
        jae     .LBB22_5
        mov     rax, qword ptr [rbp - 56]
        mov     byte ptr [rax], 45
        jmp     .LBB22_6
.LBB22_5:
        lea     rsi, [rip + .L.str.5]
        mov     edi, 77
        mov     edx, 124
        call    _d_arraybounds@PLT
.LBB22_6:
        mov     rax, qword ptr [rbp - 64]
        mov     rdx, qword ptr [rbp - 56]
        add     rsp, 80
        pop     rbp
        ret

pure nothrow @nogc @safe char[] core.internal.string.unsignedToTempString!(10u).unsignedToTempString(ulong, scope return char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword ptr [rbp - 8], rdx
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 24], rdi
        mov     rax, qword ptr [rbp - 24]
        mov     qword ptr [rbp - 32], rax
.LBB23_1:
        cmp     qword ptr [rbp - 8], 10
        jae     .LBB23_3
        mov     rax, qword ptr [rbp - 8]
        mov     dword ptr [rbp - 36], eax
        mov     qword ptr [rbp - 8], 0
        jmp     .LBB23_4
.LBB23_3:
        mov     rax, qword ptr [rbp - 8]
        xor     ecx, ecx
        mov     edx, ecx
        mov     esi, 10
        div     rsi
        mov     dword ptr [rbp - 36], edx
        mov     rdi, qword ptr [rbp - 8]
        mov     rax, rdi
        xor     ecx, ecx
        mov     edx, ecx
        div     rsi
        mov     qword ptr [rbp - 8], rax
.LBB23_4:
        mov     rax, qword ptr [rbp - 32]
        sub     rax, 1
        mov     qword ptr [rbp - 32], rax
        mov     rax, qword ptr [rbp - 32]
        cmp     rax, qword ptr [rbp - 24]
        jae     .LBB23_6
        mov     rax, qword ptr [rbp - 16]
        mov     rcx, qword ptr [rbp - 32]
        mov     edx, dword ptr [rbp - 36]
        add     edx, 48
        mov     byte ptr [rax + rcx], dl
        jmp     .LBB23_7
.LBB23_6:
        lea     rsi, [rip + .L.str.5]
        mov     edi, 77
        mov     edx, 48
        call    _d_arraybounds@PLT
.LBB23_7:
        cmp     qword ptr [rbp - 8], 0
        jne     .LBB23_1
        mov     rax, qword ptr [rbp - 32]
        mov     rcx, qword ptr [rbp - 24]
        cmp     rax, rcx
        mov     qword ptr [rbp - 48], rax
        mov     qword ptr [rbp - 56], rcx
        ja      .LBB23_10
        mov     rax, qword ptr [rbp - 16]
        mov     rcx, qword ptr [rbp - 48]
        add     rax, rcx
        mov     rdx, qword ptr [rbp - 56]
        sub     rdx, rcx
        mov     qword ptr [rbp - 64], rax
        mov     rax, rdx
        mov     rdx, qword ptr [rbp - 64]
        add     rsp, 64
        pop     rbp
        ret
.LBB23_10:
        lea     rsi, [rip + .L.str.5]
        mov     edi, 77
        mov     edx, 50
        call    _d_arraybounds@PLT

pure nothrow @nogc @trusted char[] core.internal.string.signedToTempString!(10u).signedToTempString(long, scope return char[]).trustedSlice(return char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 8], rdx
        mov     rax, qword ptr [rbp - 8]
        cmp     rax, qword ptr [rdi + 8]
        jbe     .LBB24_2
        mov     rax, qword ptr [rbp - 16]
        mov     rcx, qword ptr [rbp - 8]
        add     rcx, -1
        add     rax, 1
        mov     rdx, rcx
        add     rsp, 16
        pop     rbp
        ret
.LBB24_2:
        lea     rsi, [rip + .L.str.5]
        mov     edi, 77
        mov     edx, 122
        call    _d_assert@PLT

@safe void std.range.primitives.doPut!(std.stdio.File.LockingTextWriter, char[]).doPut(ref std.stdio.File.LockingTextWriter, ref char[]):
        push    rbp
        mov     rbp, rsp
        mov     rax, qword ptr [rdi]
        mov     rdx, qword ptr [rdi + 8]
        mov     rdi, rsi
        mov     rsi, rax
        call    @safe void std.stdio.File.LockingTextWriter.put!(char[]).put(scope char[])@PLT
        pop     rbp
        ret

@safe void std.stdio.File.LockingTextWriter.put!(char[]).put(scope char[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 8], rdx
        cmp     dword ptr [rdi + 24], 0
        mov     qword ptr [rbp - 64], rdi
        jg      .LBB26_4
        mov     rax, qword ptr [rbp - 64]
        mov     rcx, qword ptr [rax]
        mov     rdx, qword ptr [rcx]
        mov     rdi, qword ptr [rbp - 16]
        mov     rsi, qword ptr [rbp - 8]
        call    nothrow @nogc @trusted ulong std.stdio.trustedFwrite!(char).trustedFwrite(shared(core.stdc.stdio._IO_FILE)*, const(char[]))@PLT
        mov     qword ptr [rbp - 24], rax
        mov     rax, qword ptr [rbp - 16]
        cmp     qword ptr [rbp - 24], rax
        je      .LBB26_3
        lea     rdx, [rip + .L.str]
        mov     r8, qword ptr [rip + pure nothrow @nogc @safe const(char)[] std.stdio.File.LockingTextWriter.put!(char[]).put(scope char[]).__dgliteral3()@GOTPCREL]
        xor     eax, eax
        mov     ecx, eax
        mov     edi, 3109
        mov     esi, 66
        mov     r9d, eax
        call    @safe int std.exception.enforce!(std.exception.ErrnoException).enforce!(int).enforce(int, lazy const(char)[], immutable(char)[], ulong)@PLT
.LBB26_3:
        add     rsp, 64
        pop     rbp
        ret
.LBB26_4:
        mov     rax, qword ptr [rbp - 8]
        mov     rcx, qword ptr [rbp - 16]
        mov     qword ptr [rbp - 40], rcx
        mov     qword ptr [rbp - 32], rax
        mov     qword ptr [rbp - 48], 0
.LBB26_5:
        mov     rax, qword ptr [rbp - 40]
        cmp     qword ptr [rbp - 48], rax
        jae     .LBB26_8
        mov     rax, qword ptr [rbp - 32]
        mov     rcx, qword ptr [rbp - 48]
        mov     dl, byte ptr [rax + rcx]
        mov     byte ptr [rbp - 49], dl
        mov     rdi, qword ptr [rbp - 64]
        movzx   esi, byte ptr [rbp - 49]
        call    @safe void std.stdio.File.LockingTextWriter.put!(char).put(char)@PLT
        mov     rax, qword ptr [rbp - 48]
        add     rax, 1
        mov     qword ptr [rbp - 48], rax
        jmp     .LBB26_5
.LBB26_8:
        add     rsp, 64
        pop     rbp
        ret

nothrow @nogc @trusted ulong std.stdio.trustedFwrite!(char).trustedFwrite(shared(core.stdc.stdio._IO_FILE)*, const(char[])):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword ptr [rbp - 8], rdx
        mov     qword ptr [rbp - 16], rsi
        mov     qword ptr [rbp - 24], rdi
        mov     rdi, qword ptr [rbp - 16]
        mov     rdx, qword ptr [rbp - 24]
        mov     rcx, qword ptr [rbp - 8]
        mov     esi, 1
        call    fwrite@PLT
        add     rsp, 32
        pop     rbp
        ret

@safe int std.exception.enforce!(std.exception.ErrnoException).enforce!(int).enforce(int, lazy const(char)[], immutable(char)[], ulong):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     dword ptr [rbp - 4], r9d
        mov     qword ptr [rbp - 16], r8
        mov     qword ptr [rbp - 24], rcx
        mov     qword ptr [rbp - 32], rdx
        mov     qword ptr [rbp - 40], rsi
        mov     qword ptr [rbp - 48], rdi
        mov     eax, dword ptr [rbp - 4]
        test    eax, eax
        setne   r10b
        jne     .LBB28_2
        jmp     .LBB28_1
.LBB28_1:
        mov     rcx, qword ptr [rbp - 40]
        mov     r8, qword ptr [rbp - 32]
        mov     rdx, qword ptr [rbp - 48]
        mov     rax, qword ptr [rbp - 16]
        mov     rdi, qword ptr [rbp - 24]
        mov     qword ptr [rbp - 56], rcx
        mov     qword ptr [rbp - 64], r8
        mov     qword ptr [rbp - 72], rdx
        call    rax
        mov     rdi, rax
        mov     rsi, rdx
        mov     rdx, qword ptr [rbp - 72]
        mov     rcx, qword ptr [rbp - 56]
        mov     r8, qword ptr [rbp - 64]
        call    @safe void std.exception.bailOut!(std.exception.ErrnoException).bailOut(immutable(char)[], ulong, scope const(char)[])@PLT
.LBB28_2:
        mov     eax, dword ptr [rbp - 4]
        add     rsp, 80
        pop     rbp
        ret

pure nothrow @nogc @safe const(char)[] std.stdio.File.LockingTextWriter.put!(char[]).put(scope char[]).__dgliteral3():
        push    rbp
        mov     rbp, rsp
        xor     eax, eax
        mov     ecx, eax
        mov     rax, rcx
        mov     rdx, rcx
        pop     rbp
        ret

@safe void std.exception.bailOut!(std.exception.ErrnoException).bailOut(immutable(char)[], ulong, scope const(char)[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 96
        mov     rax, qword ptr [rip + std.exception.ErrnoException.__Class@GOTPCREL]
        mov     qword ptr [rbp - 16], rcx
        mov     qword ptr [rbp - 8], r8
        mov     qword ptr [rbp - 24], rdx
        mov     qword ptr [rbp - 32], rsi
        mov     qword ptr [rbp - 40], rdi
        mov     rdi, rax
        call    _d_allocclass@PLT
        mov     rcx, qword ptr [rip + std.exception.ErrnoException.__init@GOTPCREL]
        mov     rdx, qword ptr [rip + std.exception.ErrnoException.__vtbl@GOTPCREL]
        mov     rsi, rax
        mov     qword ptr [rax], rdx
        mov     qword ptr [rax + 8], 0
        mov     rax, rsi
        add     rax, 16
        add     rcx, 16
        mov     rdi, rax
        mov     qword ptr [rbp - 88], rsi
        mov     rsi, rcx
        mov     edx, 64
        call    memcpy@PLT
        cmp     qword ptr [rbp - 32], 0
        je      .LBB30_2
        mov     rdi, qword ptr [rbp - 40]
        mov     rsi, qword ptr [rbp - 32]
        call    pure nothrow @property @safe immutable(char)[] object.idup!(const(char)).idup(const(char)[])@PLT
        mov     qword ptr [rbp - 64], rax
        mov     qword ptr [rbp - 56], rdx
        lea     rax, [rbp - 64]
        mov     qword ptr [rbp - 48], rax
        jmp     .LBB30_3
.LBB30_2:
        mov     qword ptr [rbp - 80], 18
        lea     rax, [rip + .L.str.6]
        mov     qword ptr [rbp - 72], rax
        lea     rax, [rbp - 80]
        mov     qword ptr [rbp - 48], rax
.LBB30_3:
        mov     rax, qword ptr [rbp - 48]
        mov     r8, qword ptr [rax]
        mov     r9, qword ptr [rax + 8]
        mov     rdx, qword ptr [rbp - 16]
        mov     rcx, qword ptr [rbp - 8]
        mov     rsi, qword ptr [rbp - 24]
        mov     rdi, qword ptr [rbp - 88]
        call    @safe std.exception.ErrnoException std.exception.ErrnoException.__ctor(immutable(char)[], immutable(char)[], ulong)@PLT
        mov     rcx, qword ptr [rbp - 88]
        mov     rdi, rcx
        mov     qword ptr [rbp - 96], rax
        call    _d_throw_exception@PLT

pure nothrow @property @safe immutable(char)[] object.idup!(const(char)).idup(const(char)[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword ptr [rbp - 16], rdi
        mov     qword ptr [rbp - 8], rsi
        mov     rdi, qword ptr [rbp - 16]
        mov     rsi, qword ptr [rbp - 8]
        call    pure nothrow @trusted immutable(char)[] object._trustedDup!(const(char), immutable(char))._trustedDup(const(char)[])@PLT
        add     rsp, 16
        pop     rbp
        ret

pure nothrow @trusted immutable(char)[] object._trustedDup!(const(char), immutable(char))._trustedDup(const(char)[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword ptr [rbp - 16], rdi
        mov     qword ptr [rbp - 8], rsi
        mov     rdi, qword ptr [rbp - 16]
        mov     rsi, qword ptr [rbp - 8]
        call    pure nothrow immutable(char)[] object._dup!(const(char), immutable(char))._dup(const(char)[])@PLT
        add     rsp, 16
        pop     rbp
        ret

pure nothrow immutable(char)[] object._dup!(const(char), immutable(char))._dup(const(char)[]):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword ptr [rbp - 16], rdi
        mov     qword ptr [rbp - 8], rsi
        mov     rsi, qword ptr [rbp - 16]
        mov     rdi, qword ptr [rip + TypeInfo_Axa.__init@GOTPCREL]
        call    _d_newarrayU@PLT
        mov     qword ptr [rbp - 32], rax
        mov     qword ptr [rbp - 24], rdx
        mov     rdi, qword ptr [rbp - 24]
        mov     rdx, qword ptr [rbp - 16]
        mov     rsi, qword ptr [rbp - 8]
        call    memcpy@PLT
        mov     rcx, qword ptr [rbp - 32]
        mov     rdx, qword ptr [rbp - 24]
        mov     qword ptr [rbp - 48], rcx
        mov     qword ptr [rbp - 40], rdx
        mov     rcx, qword ptr [rbp - 48]
        mov     rdx, qword ptr [rbp - 40]
        mov     qword ptr [rbp - 56], rax
        mov     rax, rcx
        add     rsp, 64
        pop     rbp
        ret

ldc.register_dso:
        sub     rsp, 40
        mov     qword ptr [rsp + 8], 1
        lea     rax, [rip + ldc.dso_slot]
        mov     qword ptr [rsp + 16], rax
        lea     rax, [rip + __start___minfo]
        mov     qword ptr [rsp + 24], rax
        lea     rax, [rip + __stop___minfo]
        mov     qword ptr [rsp + 32], rax
        lea     rax, [rsp + 8]
        mov     rdi, rax
        call    _d_dso_registry@PLT
        add     rsp, 40
        ret

.L.str:
        .asciz  "/opt/compiler-explorer/ldc-latest-ci/ldc/bin/../import/std/stdio.d"

.L.str.1:
        .asciz  "/opt/compiler-explorer/ldc-latest-ci/ldc/bin/../import/std/utf.d"

.L.str.2:
        .asciz  "Invalid UTF-8 sequence"

.L.str.3:
        .asciz  "Attempted to decode past the end of a string"

.L.str.4:
        .asciz  "Encoding an invalid code point in UTF-32"

.L.str.5:
        .asciz  "/opt/compiler-explorer/ldc-latest-ci/ldc/bin/../import/core/internal/string.d"

.L.str.6:
        .asciz  "Enforcement failed"

example.__ModuleInfo:
        .long   2147483652
        .long   0
        .asciz  "example"

example.__moduleRef:
        .quad   example.__ModuleInfo

ldc.dso_slot:
        .quad   0

DW.ref._d_eh_personality:
        .quad   _d_eh_personality