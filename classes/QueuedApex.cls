public with sharing class QueuedApex implements Queueable{
    public void execute(QueueableContext context){
        //Do something

        //Chaining jobs
        System.enqueueJob(new QueuedApex());
    }
}