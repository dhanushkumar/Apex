@isTest
public class AccountServiceTest {
    public AccountServiceTest() {

       
    }

    @isTest
        public static void testCreateAccount()
        {
                Test.startTest();
                AccountService service = new AccountService();
                Account acc = service.createAccount('Test Account','007');
                insert acc;
                Test.stopTest();
                system.assertEquals('007', acc.TickerSymbol, 'Account was not created');
                Account acct = [ SELECT Id, Name, AccountNumber, TickerSymbol FROM Account WHERE Id = :acc.Id Limit 1 ];
                System.assertEquals('Test Account', acc.Name, 'incorrect name');
                System.assertEquals('007', acc.TickerSymbol, 'incorrect ticker symbol');
                System.assertEquals('007', acc.AccountNumber, 'incorrect account number');
        }

}
