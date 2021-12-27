trigger mapCodeSnippedTry on Account (before insert, before update, after insert, after update) {
map<id, account> trgNewMap = trigger.newMap;
    map<id, account> trgOldMap = trigger.oldMap;

    if (trigger.isBefore && trigger.isInsert) {
        system.debug('=======BEFORE INSERT======');
        system.debug('Before insert OLD MAP = ' + trgOldMap);
        system.debug('Before inert NEW MAP = ' + trgNewMap);
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('=======AFTER INSERT======');
        system.debug('AFTER insert OLD MAP = ' + trgOldMap);
        system.debug('AFTER inert NEW MAP = ' + trgNewMap);
    }

    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('=======BEFORE UPDATE======');
        system.debug('Before UPDATE OLD MAP = ' + trgOldMap);
        system.debug('Before UPDATE NEW MAP = ' + trgNewMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('=======AFTER UPDATE======');
        system.debug('AFTER UPDATE OLD MAP = ' + trgOldMap);
        system.debug('AFTER UPDATE NEW MAP = ' + trgNewMap);
    }
}