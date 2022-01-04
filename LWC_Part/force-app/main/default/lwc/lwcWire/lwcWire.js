import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class LwcWire extends LightningElement {

    @wire(getAccounts)accounts;
    //accounts.data=>
    //accounts.error=>

}