public class caseTriggerHandler {
    //Q1
    public static void caseValidation1(list<case> CaseTriggerNew, list<case> caseTriggerOld, map<id, case> caseTriggerNewMap, map<id, case> caseTriggerOldMap) {
        for(case eachCase: CaseTriggerNew){
            if(eachCase.Priority == 'High' && eachCase.Description == null){
                eachCase.Description.addError('When priority is High Description can not be blank');
            }
        }
    }
    //Q2
    public static void caseValidation2(list<case> CaseTriggerNew, list<case> caseTriggerOld, map<id, case> caseTriggerNewMap, map<id, case> caseTriggerOldMap) {
        // map<id, case> oldCase = caseTriggerOldMap;
        for(case eachCase: CaseTriggerNew){
            if(caseTriggerOldMap.get(eachCase.Id).priority == 'High' && eachCase.Priority != 'High'){
                eachCase.Priority.addError('Value can not be changed');
            }
        }
    }
}