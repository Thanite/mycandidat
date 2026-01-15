import { Controller } from '@hotwired/stimulus';
import Hello from '../react/controllers/Hello';
import {createRoot} from "react-dom/client";

/*
 * This is an example Stimulus controller!
 *
 * Any element with a data-controller="hello" attribute will cause
 * this controller to be executed. The name "hello" comes from the filename:
 * hello_controller.js -> "hello"
 *
 * Delete this file or adapt it for your use!
 */
export default class extends Controller {
    connect() {
        console.log(this.element)
        alert(this.element)
        // let el =document.querySelector('#hello')
        // this.element.textContent = 'Hello Stimulus! Edit me in assets/controllers/hello_controller.js';
        let root = createRoot(this.element)
        root.render(<Hello name="rrrrhffhhhhhr" />)

    }
}
