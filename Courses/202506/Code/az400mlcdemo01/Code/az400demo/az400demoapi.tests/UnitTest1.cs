namespace az400demoapi.tests;

public class UnitTest1
{
    [Fact]
    public void Test_Numbers()
    {
        int i = 10;
        int expected = 10;
        Assert.Equal(i, expected);
    }
}
