@isTest
public class DailyLeadProcessorTest {
    

    @testsetup
    static void setup()
    {
       List<lead> leads = getTestLeads(200);
       insert leads;
       
    }
    
    private static List<Lead> getTestLeads(integer count)
    {
        List<Lead> leads = new List<Lead>();
        for(integer i=0; i<count; i++)
        {
            Lead l = new Lead(LastName='LeadSourceTest-'+string.valueOf(i),Company='DK');
            leads.add(l);
        }
        return leads;
    }
    
    @istest
    static void TestExecute()
    {
     
        DailyLeadProcessor processor = new DailyLeadProcessor();
        // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
		String schedule = '0 0 0 24 08 ? 2022';
        Test.startTest();
        system.schedule('Update Lead Source Fields', schedule, processor);
        test.stopTest();
        Integer processedLeads = [select count() from lead where LeadSource = 'Dreamforce' ];
        // Now that the scheduled job has executed,
        System.assertEquals(200, processedLeads);
    }

}