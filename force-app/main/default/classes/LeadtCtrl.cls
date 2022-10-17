/**
 * @author Jordan Costa 
 */
@RestResource (UrlMapping = '/api/lead')
global with sharing class LeadtCtrl {
    
    public static LeadRepository repository;

    static {
        repository = new LeadRepository();
    }


    @HttpGet
    global static Lead findById (){
        
        RestRequest Request = RestContext.Request;

        String leadId = Request.params.get('Id');

        return repository.findById(leadId);

    }

    @HttpPost 
    global static Lead create (Lead lead){
        // RestResponse response = RestContext.response;
        // response.statusCode = 200;
        // try {
        //     repository.save(lead);
        // } catch (DmlException e) {
        //     e.getDmlMessage(0);
        //     response.statusCode = 400;
        // }catch (Exception e) {
        //     e.getMessage();
        //     response.statusCode = 400;
        // }
        insert lead;
        return lead;
    }
}
