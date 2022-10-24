/**
 * @author Jordan Costa - BRQ
 */
// Add URl remote settings
public class GetAddressOutBoundService {
    public Account getAddresFromZipCode (String zipCode){

        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://viacep.com.br/ws/' + zipcode +'/json/');
        request.setHeader('content-Type', 'application/json');
        request.setMethod('GET');


        Http http= new Http();
        HttpResponse response = http.send(request);

        System.debug( response.getStatus() );
        System.debug( response.getStatusCode() );
        System.debug( response.getBody() );
       

        ViaCepZipAddress zipAddress = (ViaCepZipAddress) JSON.deserialize((response.getBody()), ViaCepZipAddress.class);
        zipAddress.complemento = 'LT 21 Qd 50';
        System.debug( JSON.serialize(zipAddress.complemento) );

        return zipAddress.toAccount();
    }    

}
