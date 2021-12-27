public class sampleClass {
    //public string
    public string publicString = 'this is a public string...';
    public static string staticString = 'this is public static string...';
    //parameterized method
    public void printItAll(string printString){
        system.debug('print parameter string = ' + printString);
        system.debug('print public string = ' + publicString);
        system.debug('print static string = ' + staticString);
    }
}