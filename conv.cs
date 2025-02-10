using System;

namespace TemperatureConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            double celsius;
            double fahrenheit;

            Console.WriteLine("Enter the temperature in Celsius: ");
            celsius = Convert.ToDouble(Console.ReadLine());

            fahrenheit = (celsius * 9 / 5) + 32;

            Console.WriteLine("The temperature in Fahrenheit is: {0}", fahrenheit);
        }
    }
}
