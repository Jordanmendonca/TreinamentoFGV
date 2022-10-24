/**
 * @author Jordan Costa - BRQ
 */
public class GetAddressOutboundCommand extends AbstractUpdateableOutboundCommand{    

    ViaCepZipAddress zipAddress;
    AccountRepository repository;

    public GetAddressOutboundCommand(){
        this.repository = new AccountRepository();
    }


    override
    public Object transformToSend () {  
        return event.getBusinessDocumentNumber();      
    }
  
    override
    public Object send () {
        return proxy.get(targetObject + '/json');
    }

    override
    public void processResult (Object responseObject) {
       zipAddress = (ViaCepZipAddress) JSON.deserialize( (String) responseObject, ViaCepZipAddress.class);
    }
   
    override
    public void postUpdateExecute() {   //Execução de DML   
        repository.create(zipAddress.toAccount(event.getObjectId()));
    }  

}
