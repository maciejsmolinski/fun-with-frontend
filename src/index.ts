import { main } from '../output/Main';
import find, { Kind } from './api';

find("Happy", Kind.Welcoming).then(console.log)
find("Sad", Kind.Harsh).then(console.log)

main();