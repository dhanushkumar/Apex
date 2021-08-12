@isTest
public class AccountProcessorTest {

  @isTest
  private static void countContacts() {
 
     Account testAcc = new Account(Name='TestAccount');
     insert testAcc;
       List<Contact> contacts = new List<Contact>();
        Contact contact1 = New Contact(AccountId= testAcc.Id,FirstName='UnitTest', LastName='DK');
        Contact contact2 = New Contact(AccountId= testAcc.Id,FirstName='UnitTest2', LastName='DKP');
        contacts.add(contact1);
        contacts.add(contact2);
        insert contacts;
     List<Id> ids = new List<Id>();
     ids.add(testAcc.Id);
     Test.startTest();
     AccountProcessor.countContacts(ids);
     Test.stopTest();
     Account test1 =   [SELECT  Number_Of_Contacts__c FROM Account WHERE id = :testAcc.id]; 
     System.assertEquals(2, test1.Number_Of_Contacts__c);
  }
    
   @isTest
    private static void UpdateContactSizeTest()
    {
       	Account acc = new Account(Name='TestAccount');
        insert acc;
        List<Contact> contacts = new List<Contact>();
        Contact contact1 = New Contact(AccountId= acc.Id,FirstName='UnitTest', LastName='DK');
        Contact contact2 = New Contact(AccountId= acc.Id,FirstName='UnitTest2', LastName='DKP');
        contacts.add(contact1);
        contacts.add(contact2);
        insert contacts;
        
        AccountProcessor.UpdateContactSizeField(acc,contacts.size());   
        Account test1 =   [SELECT  Number_Of_Contacts__c FROM Account WHERE Name = 'TestAccount']; 
        System.assertEquals(2, test1.Number_Of_Contacts__c);
      
    }
     @isTest
     private static void getAccountSizeTest()
    {
        Account acc = new Account(Name='TestAccount');
        insert acc;
        List<Contact> contacts = new List<Contact>();
        Contact contact1 = New Contact(AccountId= acc.Id,FirstName='UnitTest', LastName='DK');
        Contact contact2 = New Contact(AccountId= acc.Id,FirstName='UnitTest2', LastName='DKP');
        contacts.add(contact1);
        contacts.add(contact2);
        insert contacts;
        
         System.assertEquals(2, AccountProcessor.getAccountContactSize(acc.Id));
        
    }
     @isTest
     private static void getAccount()
    {
       Account acc = new Account(Name='TestAccount');
       insert acc;
       Account testAcc = AccountProcessor.getAccount(acc.Id);
       System.assertEquals(acc.Id, testAcc.Id);
    }
}