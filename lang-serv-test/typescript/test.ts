
import { Whee } from './lib';

class Foo {
  foobar(message: string, options: any): void {
    console.log(message, options);
  }

  foobarlong(): any {
  }

  foowhee(): number {
  }

  foobarshort(): boolean {
  }
}

let w = new Whee();


const f = new Foo();

