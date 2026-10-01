{
  description = "Multipurpose Nix-Shell.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f (import nixpkgs { inherit system; }));
    in
    {
      devShells = forAllSystems (pkgs: {

        # jupyter (python), `nix develop .#python`
        python =
          let
            py = pkgs.python3.withPackages (ps: with ps; [
              jupyterlab
              notebook
              ipykernel
              numpy
              pandas
              matplotlib
            ]);
          in
          pkgs.mkShell {
            name = "python";
            packages = [ py ];
            shellHook = ''
              echo "Jupyter (Python) Shell Active."
            '';
          };

        # C/C++, `nix develop .#c`
        c =
          let
            runtimeLibs = with pkgs; [
              libGL
              xorg.libX11
              xorg.libXcursor
              xorg.libXi
              xorg.libXinerama
              xorg.libXrandr
              wayland
              libxkbcommon
            ];
          in
          pkgs.mkShell {
            name = "c";

            # toolchains.
            nativeBuildInputs = with pkgs; [
              gcc
              clang-tools
              gnumake
              cmake
              pkg-config
              gdb
              valgrind
            ];

            # libraries/headers.
            buildInputs = with pkgs; [
              raylib
              sqlite
            ] ++ runtimeLibs;

            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath runtimeLibs;

            shellHook = ''
              echo "C/C++ Shell Active."
            '';
          };
      });
    };
}
