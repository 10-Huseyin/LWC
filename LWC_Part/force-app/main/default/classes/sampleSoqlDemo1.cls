public class sampleSoqlDemo1 {
		
    public static void sampleSoql1(){
        account acc = [select id, name from account order by createddate desc limit 1];
        system.debug('acc = ' + acc);
        
        List<account> listAcc = [select name,AccountNumber from account order by name limit 10];
        system.debug('list account = ' + listAcc);
        
        for(account item: listAcc){
            system.debug('account record = ' + item);
            //print account's name
            string accName = item.name;
            system.debug('accName = ' + accName);
            system.debug('item.accountNumber = ' + item.AccountNumber);
            system.debug('Account id = ' + item.Id);
        } 
    }
}