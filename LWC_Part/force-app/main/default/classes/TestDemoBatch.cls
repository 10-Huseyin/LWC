public class TestDemoBatch implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext myBc){
        return Database.getQueryLocator([select id, name from account]);
    }
    
    public void execute(Database.BatchableContext myBc,List<account> MySubListFromStartMethod){
        for(account acc: MySubListFromStartMethod ){
            acc.Name=' MY ' + acc.Name;
        }
        Update MySubListFromStartMethod;
    }
    public void finish(Database.BatchableContext myBc){
        System.debug(' @@ Bathc job Completed');
    }

}