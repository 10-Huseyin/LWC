public class AcountUpdateBatch implements Database.Batchable<SObject>, Database.Stateful {
  
  public integer recordsProcessed = 0;
    public integer numberOfTimesExecuteRuns = 0;

    public List<account> start(Database.BatchableContext xyz){
        return [select id, name, site from account];
    }

    //update site to 'www.softinnovas.com' for all counts
    public void execute(Database.BatchableContext xyz, List<Account> scopeAccount){
        for(account eachAcc: scopeAccount){
            eachAcc.Site = '123www.softinnovas.com';
        }
        update scopeAccount;
        numberOfTimesExecuteRuns++;
        recordsProcessed =  recordsProcessed + scopeAccount.size();
        system.debug('in execute = recordsProcessed -> ' + recordsProcessed);
        system.debug('numberOfTimesExecuteRuns in execute = ' + numberOfTimesExecuteRuns);
    }

    public void finish(Database.BatchableContext xyz){
        system.debug('finish method called. Fin.');
        system.debug('total records processed = ' + recordsProcessed);
        system.debug('numberOfTimesExecuteRuns = ' + numberOfTimesExecuteRuns);
    }
}