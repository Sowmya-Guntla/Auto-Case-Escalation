import { LightningElement,track } from 'lwc';
import getEscalatedCases from '@salesforce/apex/EscalatedCases.getEscalatedCases';
const columns =[
    {label:'Case Id' ,fieldName :'Id', type :'text'},
    {label:'Case Number',fieldName:'CaseNumber', type:'text'},
    {label:'Escalation Status', fieldName:'Escalation_Status__c' ,type :'text'},
    {label:'Escalation Time' ,fieldName:'Escalated_Time__c', type :'date'}
]

export default class ShowEscalatedCases extends LightningElement {
    cases;
    tableColumns  = columns;
    handleOnClick(event){
       getEscalatedCases().then(result=>{this.cases = result;})
       .catch(error=>{console.log(error)});   
    }
}