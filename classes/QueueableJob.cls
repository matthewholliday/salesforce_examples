public with sharing class QueueableJob implements Queueable{
    public void execute(QueueableContext context){
        //Do something

        //Chaining jobs
        System.enqueueJob(new QueueableJob());
    }
}