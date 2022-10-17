public  class GetAddressOutboundCommand extends AbstractUpdateableOutboundCommand{

    ViaCepZipAdress zipAddress;
    AccountRepository repository;

    override
    public abstract Object transformToSend (){        
        return event.get().businessDocument__c;
    }

    override
    public Object send(){
        return proxy.get(targetObject + '/json');
    }  

    override
    public abstract void processResult (Object responseObject){
        zipAddress = (ViaCepZipAdress) JSON.deserialize( (String) responseObject, ViaCepZipAdress.class)
    }
   
    override
    public void postUpdateExecute() {

        repository.save(zipAddress.toAccount(event.getObjectId()));

    }

    public BaseRestProxy getHttpRequestProxy(EventQueue event) {
        return new RestProxy(event);
    }

}
