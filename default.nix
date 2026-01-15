{ pkgs ? import <nixpkgs> { }, pythonPackages ? pkgs.python312Packages }:

pkgs.mkShell {
  buildInputs = [
    pythonPackages.numpy 
    pythonPackages.scipy
    pythonPackages.jupyterlab
  ];
  
  shellHook = ''
    if [ ! -f $HOME/.dockerbuildphase ]; then
      touch $HOME/.dockerbuildphase
      export DOCKER_BUILD_PHASE=true
    fi
    
    if [ "$DOCKER_BUILD_PHASE" = true ]; then
      echo "Do some action in build phase"
    fi
    
    if [ "$DOCKER_BUILD_PHASE" = false ]; then
      echo "Do some action in run phase"
    fi
    
    echo "Do some action in both phases"
  '';
}