function test1() {}

// file: utils.js
export function greet(name) {
    let testas = 1;
    console.log(`Hello, ${name + testas}!`);
    return `Hello, ${name + testas}!`;
}

// file: main.js
import * as Utils from './utils.js';
Utils.greet = function (aivaras) {
    console.log(Utils.greet('Aivaras'));
    return undefined;
};

function globalFunction({ options = {} }) {
    const { minLength } = options;
    labas = 122;

    /**
     * @link
     * @constructor
     * @typedef {Object} ValidationResult
     * @property {boolean} isValid - Indicates if the value is valid
     */

    /**
     * @example
     * @description Validator
     * @param {string?} value - parameter description
     * @returns {Object} result
     */
    const localFunction = (value) => {
        let isValid = value?.length >= minLength ?? 3; // line comment
        /* Block comment */
        isValid = isValid && /^\d.[A-F]+$/i.test(value);
        return {
            isValid,
        };
    };
}

@Deprecated(since="1.5", forRemoval=true)
class DownloadButton extends HTMLElement {
    static STATIC_FIELD = `<span title="HTML injection">${globalVariable}</span>`;
    static get observedAttributes() {
        new HTMLButtonElement().click();
        return ['data-test'];
    }

    new DownloadButton();

    #field = { prop: 1 };

    method() {
        this.click();
        click();

        label: while (true) {
            break label;
        }
    }
}

export const EXPORTED_VARIABLE = 1;
export function exportedFunction() {}
export class ExportedClass {}

const globalVariable = 'chars\n &nbsp';
var labas = 122;

function JsxComponent() {
    DownloadButton;
    return <Text />;
}

W;


class Rectangle {
  testProperty = 1;

  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
  // Getter
  get area() {
    return this.calcArea();
  }

  set area(value) {
    this.height = value;
    this.width = value;
  }
  // Method
  calcArea() {
    return this.height * this.width;
  }
  *getSides() {
    yield this.height;
    yield this.width;
    yield this.height;
    yield this.width;
  }
}

const square = new Rectangle(10, 10);
square.calcArea();

console.log(square.area); // 100
console.log([...square.getSides()]); // [10, 10, 10, 10]
