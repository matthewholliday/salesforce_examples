public with sharing class ServerSideCallController {
    @AuraEnabled
    public static String getData(String myParam){
        myData myData = new myData();
        myData.myProperties = 'Test data.';
        return JSON.serialize(myData);
    }

    public class myData{
        @AuraEnabled
        public String myProperties;
    }
}