public class CallExternalSystemWhenCaseEscalated implements Queueable,Database.AllowsCallouts{
    private Id caseId;
    private String caseNumber;

    // Constructor to accept case info
    public CallExternalSystemWhenCaseEscalated(Id caseId, String caseNumber) {
        this.caseId = caseId;
        this.caseNumber = caseNumber;
    }
    public void execute(QueueableContext qc){
        HTTP http = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://reqres.in/api/users');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');
        req.setHeader('x-api-key', 'reqres-free-v1');
        Map<String, Object> payload = new Map<String, Object>{
            'caseId' => caseId,
            'caseNumber' => caseNumber
        };

        req.setBody(JSON.serialize(payload));
        HTTPResponse res = http.send(req);
        System.debug(res.getStatusCode());
        if(res.getStatusCode()==201){
            List<Callout_Log__c> log = new List<Callout_Log__c>();
            Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            if(response.containsKey('id')){
                Callout_Log__c l= new Callout_Log__c();
                l.Response__c = res.getBody();
                l.Message_Sent__c = true;
                l.Status__c ='Escalated';
                l.Case__c = caseId;
                log.add(l);
            }
            if(!log.isEmpty()){
                insert log;
            }
            
        }
    }

}