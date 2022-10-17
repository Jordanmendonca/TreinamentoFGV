global class CustomerLatLongJob implements Schedulable {

 global void execute(SchedulableContext context){
    findAccountWithoutGeoLocation();
 }

 public List<Account> findAccountWithoutGeoLocation(){

    List<Account> accounts =  [SELECT id
        FROM Account 
        WHERE BillingLatitude = null 
        AND BillingLongitude = null LIMIT 10 ];

        System.debug(JSON.serialize(accounts) ); 

        sendAccountToGenerateLotLog(FilterHelper.filterFieldsIds('Id', accounts));

        return accounts;
 }

 @future(callout=true)
 public static void sendAccountToGenerateLotLog(List<String> accountIds){

    List<Account> accounts = [SELECT id, BillingLatitude, BillingLongitude 
        FROM Account 
        WHERE Id in : accountIds];

        System.debug(JSON.serialize(accounts) ); 
 }

}
