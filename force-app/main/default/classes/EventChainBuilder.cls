public with sharing class EventChainBuilder {
    
    public void enqueue() {

        Queue__c queue = new EventBuilder().createOutboundEventFor(eventName)
        .forObjectId()
        .withReceiver()
        .withBusinessDocument()
        .build();

       System.enqueueJob(new EventExecutor ( queue) )

    }

}
