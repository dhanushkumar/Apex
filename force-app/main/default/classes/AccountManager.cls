@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount()
    {
       RestRequest request = RestContext.request;
        // grab the accountId from the end of the URL
      
        //String accId = request.requestURI.substringBetween('Account/','/contacts');
         String accId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accId LIMIT 1];
        return acc;        
    }
}