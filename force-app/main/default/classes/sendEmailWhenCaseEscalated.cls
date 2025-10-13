public class sendEmailWhenCaseEscalated {
    public static void sendEmail(String conEmail,Id cId){
        Messaging.SingleEmailMessage  email = new Messaging.SingleEmailMessage();
        String toAddress = conEmail;
        email.setToAddresses(new String[] { conEmail });
        email.setSubject('Your Case had been escalated');
        email.setPlainTextBody('Hi ,,,your case'+cId+'Has Escalted');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
        
    }

}