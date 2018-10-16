type kind =
  | Happy
  | Neutral;

let message = (kind: kind, name: string) =>
  switch (kind) {
  | Happy => {j|Heyy $name!|j}
  | Neutral => {j|Mhm, hey $name..|j}
  };

let happy = message(Happy);

let neutral = message(Neutral);

let print = msg => Js.log("[RE] " ++ msg);

let main = () => {
  happy("Stewart") |> print;
  neutral("Stewart") |> print;
};