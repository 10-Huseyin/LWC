import { LightningElement } from 'lwc';

export default class LwcLifecycleHooksParent extends LightningElement {
    constructor() {
        super();
        let childComponent = this.template.querySelector('c-lwc-lifecycle-hooks');
        console.log('Parent constructor - childComponent line 14: ',childComponent);
    }

    connectedCallback() {
        let childComponent = this.template.querySelector('c-lwc-lifecycle-hooks');
        console.log('Parent connectedCallback - childComponent line 19: ',childComponent);
    }

    renderedCallback() {
        let childComponent = this.template.querySelector('c-lwc-life-cycle-hooks');
        console.log('Parent renderedCallback - childComponent line 24: ',childComponent);
    }
}