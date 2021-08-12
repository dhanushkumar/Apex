public class LeadProcessor implements Database.Batchable<sObject> 
{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator('SELECT LeadSource FROM LEAD');
    }
    public void execute(Database.BatchableContext bc, List<lead> records){
        // process each batch of records
         List<Lead> leads = new List<Lead>();
        for(Lead record: records)
        {
            record.LeadSource = 'Dreamforce';
            leads.add(record);
            
        }
       Update leads;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}