public class ParkLocator {

     public static string[] Country(string country)
     {
         ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
         return parks.byCountry(country);
     }
}