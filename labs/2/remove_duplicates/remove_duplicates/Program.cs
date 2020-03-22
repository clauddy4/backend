﻿using System;

namespace remove_duplicates
{
    class Program
    {
        private static void Main(string[] args)
        {
            if (args.Length != 1)
            {
                Console.WriteLine("Incorrect number of arguments!" + "\n" + "Usage remove_duplicates.exe <input string>");
                Environment.Exit(1);
            }
            else
            {
                Console.Write(args[0].Distinct().ToArray());
            }
        }
    }
}
