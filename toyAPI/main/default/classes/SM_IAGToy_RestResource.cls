/*******************************************************************************************************
* Class Name        : SM_IAGToy_RestResource
* Description       : REST API Service for IAG Toys
* Author            : Owen Chapman 
* Created On        : 2020-09-17
* Modification Log  : 
* -----------------------------------------------------------------------------------------------------
* Developer        Date      Modification ID    Description
* -----------------------------------------------------------------------------------------------------
* Owen Chapman      2020-09-17    1000        Initial version
******************************************************************************************************/

@RestResource(urlMapping='/IAGToyAPI/v1/toyDetail')
global with sharing class SM_IAGToy_RestResource
{

    @HttpPost
    global static ResponseWrapper getToys(){

        //Instantioate RestContext and Wrappers
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        List<ToyWrapper> toys = new List<ToyWrapper>();
        ResponseWrapper response = new ResponseWrapper();

        try {
            //Obtain toy name values from request body
            String reqBody = req.requestBody.toString();
            List<RequestWrapper> toyReqeust = (List<RequestWrapper>) JSON.deserialize(reqBody, List<RequestWrapper>.class);

            //Loop over names and add to string set
            Set<String> toySet = new Set<String>();
            for ( RequestWrapper wrap : toyReqeust ){
                toySet.add(wrap.name);
            }

            //Find matching toys in the Toy__c object
            List<Toy__c> toyList = [SELECT Name, Description__c, Price__c, Is_Available__c FROM Toy__c WHERE Name IN :toySet];

            //Check if there are any matches
            if ( toyList.isEmpty() ){
                //Return a 'No Match Found' into the ResponseWrapper
                response = new ResponseWrapper('no toy match found');
            }
            else {
                //Loop over the queried results, pass to the ToyWrapper and add to a ToyWrapper list
                for ( Toy__c toy : toyList ){
                    ToyWrapper tyw = new ToyWrapper(toy.Name, toy.Description__c, toy.Is_Available__c, toy.Price__c);
                    toys.add(tyw);
                } 
                //Return the resulting toys and a 'Match Found' into the ResponseWrapper
                response = new ResponseWrapper(toys, 'Match Found');  
            }
            res.statusCode = 200;   
        } catch (Exception e) {
            res.statusCode = 400;    
        }    
        return response;

    }

    public class RequestWrapper {
        public String Name;
        public RequestWrapper(){}
    }

    global class ToyWrapper {
        private String name;
        private String description;
        private Boolean isAvailable;
        private Decimal price;
        ToyWrapper(String name, String description, Boolean isAvailable, Decimal price) {
            this.name = name;
            this.description = description;
            this.isAvailable = isAvailable;
            this.price = price;
        }
    }

    global class ResponseWrapper {
        public List<ToyWrapper> toys;
        public String status;
        ResponseWrapper(List<ToyWrapper> toys, String status) {
            this.toys = toys;
            this.status = status;
        }
        ResponseWrapper(String status) {
            this.status = status;
        }
        ResponseWrapper() {
        }
    }
}