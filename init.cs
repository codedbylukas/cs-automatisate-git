using System;
using CommandRunner;

namespace initConfig
{
    public static class init
    {
        public static void initFn()
        {
            Console.WriteLine("Starting the application...");
            Console.WriteLine("Do you want to initialize the repository? (y/n)(default: n)");

            string? input = Console.ReadLine();
            if (input?.ToLower() == "y")
            {
                Console.WriteLine("Initializing the repository...");
                Command.RunInit();
            }
            else if (input?.ToLower() == "n")
            {
                Console.WriteLine("Skipping repository initialization.");
            }
            else if (string.IsNullOrWhiteSpace(input))
            {
                Console.WriteLine("No input provided. Skipping repository initialization.");
            }
            else if (input == "exit" || input == "e" || input == "q" || input == "quit")
            {
                Console.WriteLine("Exiting the application...");
                Environment.Exit(0);
                return;
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter 'y' or 'n'.");
                Environment.Exit(1);
                return;
            }
        }
    }
}