@istest

public class AddPrimaryContactTest {
   
    
    	@testsetup
    static void setup()
    {
        List<Account> accounts = getAccounts('CA');
        accounts.addAll(getAccounts('NY'));
        insert accounts;
    }
    
        @istest
        private static void TestExecute()
        {
            contact contact = new Contact(FirstName='Dhanush', LastName='Paramanathan');
            AddPrimaryContact primaryContactJob = new AddPrimaryContact(contact,'CA');
            Test.startTest();
            System.enqueueJob(primaryContactJob);
            Test.stopTest();
            Integer listSize = [SELECT count() FROM Contact WHERE Contact.Account.BillingState = 'CA']; 
            System.assertEquals(50, listSize);
        }
    
    
    private static List<Account> getAccounts(string state)
    {
        List<Account> accounts = new List<Account>();
        for(integer i=0;i<50;i++)
        {
            Account acc = new Account(name=state + ' Account-'+string.valueOf(i), BillingState=state);
            accounts.add(acc);
        }
        return accounts;
    }

}