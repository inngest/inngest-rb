{ pkgs ? import <nixos-23.11> { } }:

with pkgs;

mkShell {
  buildInputs = [
    pkgs.ruby
    pkgs.bundler

    # Tools
    pkgs.ruby-lsp
    pkgs.libyaml
  ];
}
