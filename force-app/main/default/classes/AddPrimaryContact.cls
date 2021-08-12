public class AddPrimaryContact implements Queueable {
    
    private  Contact contact;
    private string state; 
      public AddPrimaryContact(Contact contact, string state)
      {
          this.contact = contact;
          this.state = state;
      }
    
     public void execute (QueueableContext context)
     {
         List<Account> accounts = [select FIELDS(STANDARD) from Account Where BillingState = :state Limit 200];
         List<Contact> contactList = new List<Contact>();
       
         for(Account account: accounts)
        {
            Contact cont = this.contact.clone(false,false,false,false);
            cont.AccountId = account.id;
            contactList.add(cont);
              
        }
        insert contactList;
     }
}