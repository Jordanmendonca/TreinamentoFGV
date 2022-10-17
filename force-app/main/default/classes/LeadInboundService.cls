/**
 * @author Jordan Costa - BRQ
 */
global with sharing class LeadInboundService {
    
    webservice
    static LeadOk create(LeadOK lead) {
        Lead leadToCreate = lead.toLead();

        lead.Id = leadToCreate.Id;

        return lead;
    }

    global class LeadOK {
        webservice String  Id;
        webservice String LastName;
        webservice String Company;
        ///webservice Address Address;

        public Lead toLead (){
            return new Lead(
             Id= Id,
             LastNAme = LastName,
             Company = Company
            );
        }
    }    

}
