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

    public class ViaCepZipAddress {
        public string cep;
        public string logradouro;
        public string complemento;
        public string bairro;
        public string localidade;
        public string ibge;
        public string uf;
        public string gia;
        public string ddd;
        public string siafi;      
        
        public Account toAccount (){
            Account account = new Account();
            account.BillingStreet = logradouro + ' ' + complemento;
            account.BillingPostalCode = cep;
            account.BillingCity = localidade;
            account.BillingState = uf;
            return account;
        }
        
    }

}
