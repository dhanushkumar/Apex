@isTest
public class ParkLocatorTest {
 @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
       
        List<string> result = ParkLocator.Country('USA');
      List<String> parks =  new List<string>();
               parks.add('Inman Park');
                 parks.add('Piedemont Park');
        // Verify that a fake result is returned
        System.assertEquals(parks, result); 
    }
}