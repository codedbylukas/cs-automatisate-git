using Xunit;
using System;
using System.Reflection;
using cs_automatisate_git;
using CommandRunner; 
using initConfig;

namespace cs_automatisate_git.Tests;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
        Type klasseTyp = typeof(Command);
        MethodInfo? methode = klasseTyp.GetMethod("Run", BindingFlags.Public | BindingFlags.Static);
        Assert.NotNull(methode);
        Assert.Equal(typeof(void), methode.ReturnType);
    }
}