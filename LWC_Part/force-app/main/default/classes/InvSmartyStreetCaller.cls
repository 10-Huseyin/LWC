public with sharing class InvSmartyStreetCaller {
  @InvocableMethod(label='Call SmartyStreet' description='Makes callout to SmartyStreet Api')
    public static void getCallOut(List<ID> locationIds) {
      myRun(locationIds[0]);
      
        
      }
      @future(callout=true) public static void myRun(Id locId){
      try{
        SmartyStreetCards__c apiCreds=SmartyStreetCards__c.getOrgDefaults();
        Location__c loc=[SELECT Street__c,State__c, Postal_Code__c FROM Location__c WHERE Id=:locId WITH SECURITY_ENFORCED]; 
        String path='street-address?'
            +'street='+EncodingUtil.urlEncode(loc.Street__c,'UTF-8')
            +'&auth-id='+apiCreds.Auth_Id__c
            +'&auth-token='+apiCreds.Auth_token__c
            +'&state='+loc.State__c
            +'&zipcode='+loc.Postal_Code__c
            +'&match=enhanced';
            
           
            Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint('callout:SmartyStreet');
      request.setMethod('GET');
      HttpResponse response = http.send(request);
      System.debug('Response'+response.getBody());

      Boolean isSuccess=response.getStatusCode()==200;
      update new Location__c(Id=locId, Verified__c=isSuccess);
    }
    catch(Exception exc){
      system.debug('Error'+ exc.getMessage());      
    }
    }
  }