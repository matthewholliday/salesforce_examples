public with sharing class LTSController {
    @AuraEnabled
    public static String getSomething(){
        return 'xyz';
    }
}