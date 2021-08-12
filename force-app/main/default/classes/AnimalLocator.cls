public class AnimalLocator {
    
    public static String getAnimalNameById(Integer animalId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ string.valueOf(animalId));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        string name ='';
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
           Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
           Map<String, Object> animal =  (Map<String, Object>)results.get('animal');
       
        
            name = string.ValueOf(animal.get('name'));
            System.debug('Received the following animal:');
            System.debug(animal);
            
        }
        return name;
    }

}