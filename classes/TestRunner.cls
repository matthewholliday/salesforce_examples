@isTest
public with sharing class TestRunner {

    public static testMethod void run(){
        String myString = 'a';
        Integer tesInteger = 2;
        myString = 'b';
        System.debug('testLine');
    }
}