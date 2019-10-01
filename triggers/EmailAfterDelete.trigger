trigger EmailAfterDelete on sfal__Alert__c (after delete) {
    
    Messaging.reserveSingleEmailCapacity(trigger.size);
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    for (sfal__Alert__c alert : Trigger.old) {
    
        User createdBy = [SELECT Name FROM User where id = :alert.CreatedById];
        Contact student = [SELECT Name FROM Contact where id = :alert.sfal__Advisee__c];
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] {'sfsupport@stedwards.edu'});
        email.setSubject('Deleted Alert');
        
        email.setPlainTextBody('This message is to alert you that the Alert named ' + alert.Name + ' has been deleted.'
        + '\nDeleted by: ' + UserInfo.getName() 
        + '\nAlert was created by: ' + createdBy
        + '\nFor Student: ' + student   
        + '\nStatus of: ' + alert.sfal__Status__c
        + '\nAlert Type: ' + alert.RecordTypeName__c
        + '\nPriority: ' + alert.sfal__Priority__c 
        + '\nAlert comments: ' + alert.sfal__Comments__c );
        
        emails.add(email);
    }
    Messaging.sendEmail(emails);
}