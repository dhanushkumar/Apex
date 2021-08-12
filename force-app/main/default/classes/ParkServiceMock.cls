@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        // 
        List<String> parks =  new List<string>();
               parks.add('Inman Park');
                 parks.add('Piedemont Park');
        ParkService.byCountryResponse responseByCountry = new ParkService.byCountryResponse();
               responseByCountry.return_x = parks ;
               
       
        // end
        response.put('response_x', responseByCountry); 
   }
}