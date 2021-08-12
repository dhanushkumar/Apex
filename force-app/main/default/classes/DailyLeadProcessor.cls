public class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext context)
    {
        List<Lead> blankLeads = getBlankLeadSourceLeads();
        List<lead> leads = new List<Lead>();
        for(Lead lead: blankLeads)
        {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
        }
        update leads;
    }
    
    private List<Lead> getBlankLeadSourceLeads()
    {
        List<Lead> leads = [Select LeadSource from lead where LeadSource = '' Limit 200];
        return leads;
    }

}