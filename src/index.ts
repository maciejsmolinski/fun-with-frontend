import PureScript from '../output/Main';
import find, { Kind } from './api';
import ReasonML from './Main.re';

find("Happy", Kind.Welcoming).then(console.log)
find("Sad", Kind.Harsh).then(console.log)

PureScript.main();
ReasonML.main();