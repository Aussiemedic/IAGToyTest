@isTest
private class TC_IAGToy_TestClass {
    static testMethod void toyTest_01() {

        Toy__c toy = new Toy__c(Name = 'ToyTest');
        insert toy;

         RestRequest req = new RestRequest(); 
         RestResponse res = new RestResponse();

         req.requestUri = '/services/apexrest/IAGToyAPI/v1/toyDetail'; 
         req.addHeader('httpMethod', 'POST');
         req.addHeader('Content-Type', 'application/json');  

         RestContext.request = req; 
         RestContext.response= res;

         String postData = '[{"Name":"ToyTest"}]';
         req.requestBody = Blob.valueof(postData);

         Test.startTest();
         SM_IAGToy_RestResource.getToys(); 
         Test.stopTest();

   }

   static testMethod void toyTest_02() {

     RestRequest req = new RestRequest(); 
     RestResponse res = new RestResponse();

     req.requestUri = '/services/apexrest/IAGToyAPI/v1/toyDetail'; 
     req.addHeader('httpMethod', 'POST');
     req.addHeader('Content-Type', 'application/json');  

     RestContext.request = req; 
     RestContext.response= res;

     String postData = '[{"Name":"ToyTest"}]';
     req.requestBody = Blob.valueof(postData);

     Test.startTest();
     SM_IAGToy_RestResource.getToys(); 
     Test.stopTest();

}

}