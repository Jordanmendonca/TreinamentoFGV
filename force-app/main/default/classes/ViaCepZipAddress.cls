/**
 * @author Jordan Costa - BRQ
 */
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
    
    public Account toAccount (String accountId){
        Account account = new Account( Id = accountId );
        account.BillingStreet = logradouro + ' ' + complemento;
        account.BillingPostalCode = cep;
        account.BillingCity = localidade;
        account.BillingState = uf;
        return account;
    }
    
}