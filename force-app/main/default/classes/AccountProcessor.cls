public class AccountProcessor {
  
    @future
    public static void countContacts(List<Id> recordIds)
    {
       for(Id accountId: recordIds)
       {     
            Account account = getAccount(accountId);
           	integer size = getAccountContactSize(accountId);
            UpdateContactSizeField(account, size);
            System.debug('Account contacts: '+ account.Number_Of_Contacts__c);
       }
    }
    
    public static Account getAccount(Id accountId)
    {
        Account account = [SELECT  Number_Of_Contacts__c FROM Account WHERE Id = :accountId];
        return account;
    }
     public static integer getAccountContactSize(Id accountId)
    {
        List<Contact> contacts = [SELECT Name FROM Contact WHERE accountId = :accountId];
        return contacts.size();
    }
    public static void UpdateContactSizeField(Account account,integer count)
    {
        account.Number_Of_Contacts__c = count;
        Update account;
    }
}