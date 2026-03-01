{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_20
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.prettier
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin:$PATH"
    echo "⚡ Node $(node --version) | pnpm $(pnpm --version) | TSServer ready"
  '';
}
