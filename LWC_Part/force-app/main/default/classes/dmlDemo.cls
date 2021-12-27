public class dmlDemo {
     
    public void sfdxdemoMethod(){
        System.debug('Created this method in VS Code');
    }
    public void sfdxdemoMethodTwo(){
        System.debug('Created this second method in VS Code');
    }


    public static void dmlInsertDemo(){
        
        account acc= new account();
        
        acc.Name='SoftInnovas';
        acc.AccountNumber='ACSI-123412';
        acc.Phone='4323423';
 		system.debug('before acc'+acc);
        
        insert acc; //dml
        system.debug('after acc'+ acc);
    }
    public static void dmlInsertDemo_1(){
        account acc= new account();
        
        acc.Name='SoftInnovas ghj';
        acc.AccountNumber='ACSI-123412';
        acc.Phone='4323423';
 		system.debug('before acc'+acc);
        
        insert acc; //dml
        system.debug('after acc'+ acc);
        //update,set new values
        acc.Name='Salesforce';
        update acc; //dml update
        system.debug('updated acc'+acc);
    }
    
    public static void dmlInsertDemo_2(){
        account acc = [select id,name from account where name='Salesforce' limit 1];
         acc.Name='Salesforce Edited';
        
        update acc;
        system.debug('acc=' + acc);
        }
	public static void dmlInsertDemo_3(){
        account acc = [select id,name from account where name='Salesforce Edited' limit 1];
        system.debug('acc.id=' + acc.id);
        contact cont=new contact();
        cont.LastName='DO';
        
        insert cont;
		 system.debug('cont=' + cont);
        
            
        }    
    
}