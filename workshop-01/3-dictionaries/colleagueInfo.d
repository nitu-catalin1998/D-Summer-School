import std.stdio : writeln;

struct ColleagueInfo
{
    string mail;
    string telefon;
}

void main()
{
    ColleagueInfo[string] d;
    d["me"] = ColleagueInfo("me@me.me", "+382");
    writeln("me", ": ", d["me"]);
}