public with sharing class AccountService {
    public AccountService() {

    }
    public Account createAccount (string accountName, string accountNumber)
    {
        Account newAcct = new Account(
            Name = accountName,
            AccountNumber = accountNumber,
            TickerSymbol = accountNumber
        );
        return newAcct;
    }
}