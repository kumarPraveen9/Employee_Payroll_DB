using NUnit.Framework;
using Employee_Payroll;

namespace Payroll_Testing
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void CheckFor_Connection_Establishment()
        {
            string result = Program.EstablishConnection();
            Assert.AreEqual("Connection was established.",result);
        }
    }
}