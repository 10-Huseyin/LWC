@istest
public class sampleSoqlDemo1Test {
 @istest static void testmethod1(){
        account acc = new account();
        acc.Name = 'test account';
        //insert acc;
        sampleSoqlDemo1.sampleSoql1();
     
    System.assert(acc.Id != null);
    system.assertEquals('test account', acc.Name);
    }
	

}