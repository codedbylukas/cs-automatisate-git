using System;
using CommandRunner;

namespace BranchMode
{
    public static class Branch
    {
        public static void createBranch()
        {
            Console.WriteLine("Enter the name of the new branch you want to create (or 'exit', 'e', 'q', 'quit' to exit):");
            string? branchName = Console.ReadLine();

            if (branchName?.ToLower() == "exit" || branchName?.ToLower() == "e" || branchName?.ToLower() == "q" || branchName?.ToLower() == "quit")
            {
                Console.WriteLine("Exiting the application...");
                Environment.Exit(0);
            }
            else if (string.IsNullOrWhiteSpace(branchName))
            {
                Console.WriteLine("Branch name cannot be empty. Please try again.");
                Environment.Exit(1);
            }
            else
            {
                Command.Run($"git switch -c {branchName}");
                Console.WriteLine($"Branch '{branchName}' created and switched to it.");
            }
        }
        public static void switchBranch()
        {
            Console.WriteLine("Enter the name of the branch you want to work on (or 'exit', 'e', 'q', 'quit' to exit):");
            string? branchName = Console.ReadLine();

            if (branchName?.ToLower() == "exit" || branchName?.ToLower() == "e" || branchName?.ToLower() == "q" || branchName?.ToLower() == "quit")
            {
                Console.WriteLine("Exiting the application...");
                Environment.Exit(0);
            }
            else if (string.IsNullOrWhiteSpace(branchName))
            {
                Console.WriteLine("Branch name cannot be empty. Please try again.");
                Environment.Exit(1);
            }
            else
            {
                Command.Run($"git switch {branchName}");
                Console.WriteLine($"Switched to branch '{branchName}'.");
            }
        }
    }
}