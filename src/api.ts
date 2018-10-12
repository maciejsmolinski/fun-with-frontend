type Message = "welcoming" | "harsh";

export enum Kind {
  Welcoming,
  Harsh
}

const find = (name: string, kind: Kind): Promise<string> => {
  switch (kind) {
    case Kind.Harsh:
      return Promise.resolve(`Huh, hey ${name}..`);
    default:
      return Promise.resolve(`Heyy ${name}!`);
  }
};

export default find;
