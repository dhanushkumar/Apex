@isTest
public class AccountManagerTest {
   @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://wise-goat-iypmj7-dev-ed.lightning.force.com/services/apexrest/Accounts/'
            + recordId ;
           
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
    }
    
    @isTest static void getAccountIdTest()
    {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://wise-goat-iypmj7-dev-ed.lightning.force.com/services/apexrest/Accounts/'+ recordId ;
          request.httpMethod = 'GET';
        RestContext.request = request;
        // String accId = request.requestURI.substringBetween('Account/','/contacts');
        
           String accId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        
         System.assertEquals(recordId, accId);
    }
     @isTest static void tescreateTestRecord() {
        Id recordId = createTestRecord();
        system.assertNotEquals(recordId, null);
     }
     static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(
            Name='Test Account');
        insert accountTest;
        Contact con = new Contact(LastName='Test Contact', AccountId = accountTest.id);
        insert con;
        return accountTest.Id;
    }          
}