using System;
using CommandRunner;

namespace Commits
{
    public static class commit
    {
        public static bool commitFn()
        {
            Console.WriteLine("Enter a commit message (or 'exit', 'e', 'q', 'quit' to exit):");
            string? command = Console.ReadLine();

            if (command?.ToLower() == "exit" || command?.ToLower() == "e" || command?.ToLower() == "q" || command?.ToLower() == "quit")
            {
                Console.WriteLine("Exiting the application...");
                return false;
            }
            else if (string.IsNullOrWhiteSpace(command))
            {
                Console.WriteLine("Commit message cannot be empty. Please try again.");
                return true;
            }
            else
            {
                Command.Run("git add .");
                Command.Run($"git commit -m \"{command}\"");
                Console.WriteLine("Commit successful.");
                return true;
            }
        }
    }
}