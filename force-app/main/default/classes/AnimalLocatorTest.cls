@istest
public class AnimalLocatorTest {
    
    @isTest static  void testGetCallout() {
      // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    String animalName = AnimalLocator.getAnimalNameById(2);
    System.assertEquals('chicken', animalName, 'The name should be chicken.');          
    }   

}