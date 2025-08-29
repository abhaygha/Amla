using System;
using Newtonsoft.Json;

namespace TestProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello from Test Project!");
            
            // Test JSON serialization
            var testObj = new { Name = "Test", Value = 42 };
            var json = JsonConvert.SerializeObject(testObj);
            Console.WriteLine($"JSON: {json}");
            
            // Test logging
            Console.WriteLine("Application started successfully");
        }
    }
}
