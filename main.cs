using System;
using CommandRunner;
using initConfig;
using Commits;
using Push;


public static class cs_automatisate_git
{
    public static void Main()
    {
        init.initFn();
    bool pushing = push.pushFn();

    while (commit.commitFn(pushing))
    {

    }
    }
}

