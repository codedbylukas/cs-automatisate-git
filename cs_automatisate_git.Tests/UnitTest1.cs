using Xunit;
using System;
using System.Collections.Generic;
using cs_automatisate_git;
using CommandRunner;
using initConfig;

namespace cs_automatisate_git.Tests;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
// 1. Hole den Typen der Klasse "Command"
        Type klasseTyp = typeof(Command);

        // 2. Suche nach der statischen Methode "Run"
        MethodInfo? methode = klasseTyp.GetMethod("Run", BindingFlags.Public | BindingFlags.Static);

        // 3. Prüfen, ob die Methode überhaupt existiert (nicht null ist)
        Assert.NotNull(methode);

        // 4. Prüfen, ob der Rückgabetyp exakt "void" ist
        Assert.Equal(typeof(void), methode.ReturnType);
    }
}