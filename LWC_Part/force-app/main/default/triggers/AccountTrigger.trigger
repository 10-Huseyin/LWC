trigger AccountTrigger on Account (before insert,after insert,before update,after update){
 
    if(trigger.isBefore){
        System.debug('Before insert trigger of account object.');
        System.debug('Trigger.new in before trigger= '+ trigger.new);

    }
    if(trigger.isAfter){
        System.debug('After insert trigger of account object.');
        System.debug('Trigger.new in after trigger= '+ trigger.new);

    }
		
   if(trigger.isAfter && trigger.isInsert){
        list<account> newAccounts = trigger.new;
        list<account> oldAccounts = trigger.old;

        system.debug('after insert newAccounts = ' + newAccounts);
        system.debug('after insert oldAccounts = ' + oldAccounts );
    }
    if(trigger.isAfter && trigger.isUpdate){
        //print old account name
        for (account oldAcc : trigger.old) {
            system.debug('Old ID = ' + oldAcc.Id + ', Old Acc name = ' + oldAcc.Name);
        }

        //print new account name
        for (account newAcc : trigger.new) {
            system.debug('New ID = ' + newAcc.Id + ', New Acc name = ' + newAcc.Name);
        }
    }
}