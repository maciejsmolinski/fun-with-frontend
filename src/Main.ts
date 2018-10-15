export enum Kind {
  Welcoming,
  Neutral
}

const welcome = (kind: Kind) => (name: string) => {
  switch (kind) {
    case Kind.Neutral:
      return `Mhm, hey ${name}..`;
    case Kind.Welcoming:
      return `Heyy ${name}!`;
    default:
      return `Welcome ${name}`;
  }
}

const welcoming = welcome(Kind.Welcoming);
const neutral = welcome(Kind.Neutral);

const print = (msg) => console.log('[TS] ' + msg);

const main = () => {
  print(welcoming('Stewart'))
  print(neutral('Stewart'))
}

export default {
  main
}