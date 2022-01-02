import { LightningElement,track } from 'lwc';

export default class Decorators 
extends LightningElement {
    message='This is default message';  
    @track contact={
        "FirstName":"John",
        "LastName":"Travolta"
    }
    handleClickChangeButton(){
        this.message='This message '+'1234';
        this.contact.FirstName=this.contact.FirstName+' John';
        this.contact.LastName=this.contact.LastName+' Do';

    }

    get FullName(){
        return this.contact.FirstName+this.contact.LastName;
    }

}