@isTest
public class EmailAfterDeleteTest
{
    @isTest(SeeAllData=true)
    static void testEmailAfterDelete()
    {
        
        sfal__Alert__C testAlert = new sfal__Alert__c ();
        testAlert.RecordTypeId = '0121U000000MknCQAS';
        testAlert.sfal__Advisee__c = '0031U00000QpjLuQAJ';
        testAlert.sfal__Status__c = 'New';
        testAlert.sfal__Comments__c = 'Test Alert';
        insert testAlert;
        
        
        Test.startTest();
        
        delete testAlert;
        
        Test.stopTest();
 
    }
}