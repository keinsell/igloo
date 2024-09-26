let
  keinsell = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0idNvgGiucWgup/mP78zyC23uFjYq0evcWdjGQUaBH";
  users = [keinsell];
  luminar = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBwdArHxYfGBy4uViFIPXqgMLsvnXVw/QNSi4hihQOLK";
  systems = [luminar];
in {
  "secret1.age".publicKeys = [
    keinsell
    luminar
  ];
  "secret2.age".publicKeys = users ++ systems;
}
