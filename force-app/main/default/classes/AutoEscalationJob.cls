public class AutoEscalationJob implements Schedulable{
    public void execute(SchedulableContext sc){
        //DateTime gmtDateTime = System.now(); // current time in GMT
        //DateTime istDateTime = gmtDateTime.addHours(5).addMinutes(30);
        //DateTime twoHoursAgo = istDateTime.addHours(-2);
        DateTime nowTime = System.Now();
        List<Case> newStatusCases = [select id,CaseNumber,Status,Contact.Email,Escalated_Time__c,Escalation_Status__c,CreatedDate__c from Case
                                     where  Escalation_Status__c like'Not Escalated%'];
        System.debug('Number of cases found: ' + newStatusCases.size());
        for(Case c:newStatusCases){
            System.debug('Cases found: ' + newStatusCases.size());
            c.Escalation_Status__c = 'Escalated';
            c.Escalated_Time__c = nowTime;
            if(c.ContactId != null && c.Contact.Email != null){
                sendEmailWhenCaseEscalated.sendEmail(c.Contact.Email,c.id);
            }
            System.enqueueJob(new CallExternalSystemWhenCaseEscalated(c.Id,c.CaseNumber));
        }
        if(!newStatusCases.isEmpty()){
            update newStatusCases;
        }
        
        }
         
        
    }