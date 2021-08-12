@istest
public class LeadProcessorTest {
   
    @istest
    public static void getLeadsTest()
    {
        List<Lead> leads = getLeads(200);
        System.assertEquals(200, leads.Size());
    }
    
    @testSetup
    static void setup() {
        List<Lead> leads = getLeads(200);
        insert leads ;
    }
    
     @istest
    public static void LeadUpdateTest()
    {
     
        Test.startTest();
        LeadProcessor processor = new LeadProcessor();
        Database.executeBatch(processor);
        Test.stopTest();
        List<Lead> leadsResult = [select LeadSource from Lead where LeadSource = 'Dreamforce'];
        System.assertEquals(200, leadsResult.Size());
    }
    
    private  static List<Lead> getLeads(integer count)
    {
        List<Lead> leads = new List<Lead>();
        for(integer i=0; i<count; i++)
        {
            
         Lead lead = new Lead(FirstName='Test'+i,LastName='Lead'+i,Status='Open - Not Contacted', Company='Its143');
         leads.add(lead);
        }
        return leads;
    }

}