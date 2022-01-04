import FirstName from '@salesforce/schema/Contact.FirstName';
import { LightningElement, track } from 'lwc';

export default class LwcLoops extends LightningElement {
    @track contacts=[
        {
            FirstName:'Ali',
            LastName:"Veli",
            contactindex:1
        },
        {
            FirstName:'John',
            LastName:"Do",
            contactindex:2
        },
        {
            FirstName:'Mary',
            LastName:"Moore",
            contactindex:3
        },
        {
            FirstName:'Herold',
            LastName:"Finch",
            contactindex:4
        },
        {
            FirstName:'Dexter',
            LastName:"Morgan",
            contactindex:5
        },

    ];
}