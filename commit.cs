using System;
using CommandRunner;
using BranchMode;

namespace Commits
{
    public static class commit
    {
        public static bool commitFn(bool pushing)
        {
            Console.WriteLine("Enter a commit message (or 'exit', 'e', 'q', 'quit' to exit):");
            string? command = Console.ReadLine();
            string? lowerCommand = command.ToLower();
            if (lowerCommand == "exit" || lowerCommand == "e" || lowerCommand == "q" || lowerCommand == "quit")
            {
                Console.WriteLine("Exiting the application...");
                return false;
            }
            else if (string.IsNullOrWhiteSpace(command))
            {
                Console.WriteLine("Commit message cannot be empty. Please try again.");
                return true;
            }
            else if (lowerCommand == "b" || lowerCommand == "branch mode")
            {
                BranchMode();
                Environment.Exit(0);
                return true;
            }
            else if (lowerCommand == "gl" || lowerCommand == "git log")
            {
                Command.Run("git log");
                Environment.Exit(0);
                return true;
            }
            else
            {
                Command.Run("git add .");
                Command.Run($"git commit -m \"{command}\"");
                if (pushing)
                {
                    Command.Run("git pull --rebase");
                    Command.Run("git push");
                }
                Console.WriteLine("Commit successful.");
                return true;
            }
        }

        public static void BranchMode()
        {
            Console.WriteLine("Do you want to create a new branch and switch to it? (s/c)(s to switch to an existing branch, c to create a new branch)");
            string? branchChoice = Console.ReadLine();
            if (branchChoice?.ToLower() == "s")
            {
                Branch.switchBranch();
            }
            else if (branchChoice?.ToLower() == "c")
            {
                Branch.createBranch(true);
            }
        }
    }
}
