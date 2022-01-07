import { LightningElement, api } from 'lwc';

export default class lwcChildComponent extends LightningElement {
    @api messageInChild = 'This message is of Child component';

    @api handleParentCall(message) {
        console.log('Received from Parent component: ', message);
    }
}