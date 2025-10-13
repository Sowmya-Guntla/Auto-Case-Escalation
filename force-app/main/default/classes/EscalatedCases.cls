public class EscalatedCases {
    @AuraEnabled(Cacheable=true)
    public static List<Case> getEscalatedCases(){
        List<Case> escalatedCases =[select id,CaseNumber,Escalation_Status__c,Escalated_Time__c from Case where Escalation_Status__c = 'Escalated'];
        return escalatedCases;
    }

}