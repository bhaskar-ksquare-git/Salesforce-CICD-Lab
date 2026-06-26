import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const MIN_NAME_LENGTH = 2;
const MAX_NAME_LENGTH = 50;

export default class SampleCicdComponent extends LightningElement {
    @track inputName = '';
    @track greeting = '';
    @track errorMessage = '';
    @track submitCount = 0;

    get isSubmitDisabled() {
        return !this.inputName || this.inputName.trim().length < MIN_NAME_LENGTH;
    }

    get hasError() {
        return this.errorMessage !== '';
    }

    handleNameChange(event) {
        this.inputName = event.target.value;
        this.greeting = '';
        this.errorMessage = '';
    }

    handleSubmit() {
        const name = this.inputName.trim();

        if (name.length < MIN_NAME_LENGTH) {
            this.errorMessage = `Name must be at least ${MIN_NAME_LENGTH} characters.`;
            return;
        }

        if (name.length > MAX_NAME_LENGTH) {
            this.errorMessage = `Name must not exceed ${MAX_NAME_LENGTH} characters.`;
            return;
        }

        this.submitCount += 1;
        this.greeting = this.buildGreeting(name);
        this.errorMessage = '';

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: this.greeting,
                variant: 'success'
            })
        );
    }

    buildGreeting(name) {
        return `Hello, ${name}! Welcome to the CI/CD pipeline test component.`;
    }
}
