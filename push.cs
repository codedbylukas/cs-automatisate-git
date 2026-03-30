using System;
using CommandRunner;

namespace Push
{
    public class push
    {
        public static bool pushFn()
        {
            Console.WriteLine("Do you want to push it after every modification? (y/n)(default: y)");
            string input = Console.ReadLine();
            if (input == "y" || input == "Y" || input == "")
            {
                Console.WriteLine("Pushing after every modification enabled.");
                return true;
            }
            else if (input == "n" || input == "N")
            {
                Console.WriteLine("Pushing after every modification disabled.");
                return false;
            }
            else
            {
                Console.WriteLine("Invalid input, please enter y or n.");
                return pushFn();
            }
        }
    }
}
