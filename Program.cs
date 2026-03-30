using System;
using CommandRunner;
using initConfig;
using Commits;
using Push;

init.initFn();
bool pushing = push.pushFn();

while (commit.commitFn(pushing))
{

}
