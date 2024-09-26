{pkgs, ...}: {
  home.packages = with pkgs; [
    turtle
    sushi
    nautilus-open-any-terminal
    nautilus
    evince
    gnome-console
    gnome-terminal
  ];
}
