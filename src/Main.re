type kind =
  | Welcoming
  | Neutral;

let welcome = (kind: kind, name: string) =>
  switch (kind) {
  | Welcoming => {j|Heyy $name!|j}
  | Neutral => {j|Mhm, hey $name|j}
  };

let welcoming = welcome(Welcoming);

let neutral = welcome(Neutral);

let print = msg => Js.log("[RE] " ++ msg);

let main = () => {
  welcoming("Stewart") |> print;
  neutral("Stewart") |> print;
};