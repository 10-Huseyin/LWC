trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
        
     /*if(trigger.IsBefore){
    if(trigger.IsInsert || trigger.IsUpdate){
      //caseTriggerHandler.caseValidation1(Trigger.new, Trigger.old, Trigger.NewMap, Trigger.OldMap);
      caseTriggerHandler.caseValidation2(Trigger.new, Trigger.old, Trigger.NewMap, Trigger.OldMap);
    }
  }*/   
        
    system.debug('We are in the triggers');
    if(trigger.isAfter){
        system.debug('We are in the after triggers');
        for (case eachCase : trigger.new) {
            system.debug(eachCase);
            system.debug('case id = ' + eachcase.id + ', last modified date = ' + eachcase.LastModifiedDate);
       
        }
    }
    
    if(trigger.isBefore)
    system.debug('We are in the before triggers');
    if(trigger.isUpdate){
					

        if(trigger.isBefore){
            system.debug('We are in the before Update triggers');
            for (case eachCase : trigger.new) {
                system.debug('case id = ' + eachcase.id + ', last modified date = ' + eachcase.LastModifiedDate);
            }
        }
        if(trigger.isAfter){
            system.debug('We are in the after Update triggers');
        }
    }
    if(trigger.isInsert){
        if(trigger.isBefore){
            system.debug('We are in the before Insert triggers');
        }        
        if(trigger.isAfter){
            system.debug('We are in the after Insert triggers');
        }
    }
}