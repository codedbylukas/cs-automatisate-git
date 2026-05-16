using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace CommandRunner
{
    public static class Command
    {
        public static void Run(string? command)
        {
            string shell;
            string args;

            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                shell = "cmd.exe";
                args = $"/c \"{command}\"";
            }
            else // Linux or macOS
            {
                shell = "/bin/sh";
                args = $"-c \"{command}\"";
            }

            ProcessStartInfo startInfo = new ProcessStartInfo
            {
                FileName = shell,
                Arguments = args,
                UseShellExecute = false,
                CreateNoWindow = false
            };

            using (Process process = Process.Start(startInfo))
            {
                process?.WaitForExit();
            }
        }
        public static void RunInit() 
        {
            Run("git init");
        }
    }
}