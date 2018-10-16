export enum Kind {
  Happy,
  Neutral
}

const message = (kind: Kind) => (name: string) => {
  switch (kind) {
    case Kind.Happy:
      return `Heyy ${name}!`;
    case Kind.Neutral:
      return `Mhm, hey ${name}..`;
    default:
      throw new Error(`Unhandled case for kind ${kind}`);
  }
}

const happy = message(Kind.Happy);

const neutral = message(Kind.Neutral);

const print = (msg) => console.log('[TS] ' + msg);

const main = () => {
  print(happy('Stewart'))
  print(neutral('Stewart'))
}

export default {
  main
}