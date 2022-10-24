/**
 * @author Jordan Costa - BRQ
 */
public virtual class AccountRepository extends AbstractRepository {
   
    public Account create (Account account){
        
        if(account.id == null){
            
            insert account;
        } else {
            
            update account;
        }      

         return account;
    }

}
