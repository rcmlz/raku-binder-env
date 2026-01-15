let
  # Pinning nixpkgs to specific release
  # To get sha256 use "nix-prefetch-git <url> --rev <commit>"
  # nix-prefetch-git https://github.com/NixOS/nixpkgs.git --rev 25.11
  commitRev="871b9fd269ff6246794583ce4ee1031e1da71895";
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${commitRev}.tar.gz";
    hash = "sha256-M101xMtWdF1eSD0xhiR8nG8CXRlHmv6V+VoY65Smwf4=";
  };
  pkgs = import nixpkgs { config = { allowUnfree = true; }; };
  pythonPackages = pkgs.python36Packages;
in
pkgs.mkShell {
  buildInputs = [
    pythonPackages.numpy 
    pythonPackages.scipy
    pythonPackages.jupyterlab
  ];
  
  shellHook = ''
    echo "execute any bash commands before starting jupyterlab";
  '';
}