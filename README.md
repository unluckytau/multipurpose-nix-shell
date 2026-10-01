## <p align="center"> Multipurpose Nix-Shell. </p>

<p align="center">
<img src="https://img.shields.io/badge/C%2B%2B-1c1b19?style=for-the-badge&logo=cplusplus&logoColor=e08060">
<img src="https://img.shields.io/badge/C-1c1b19?style=for-the-badge&logo=c&logoColor=e08060">
<img src="https://img.shields.io/badge/Python-1c1b19?style=for-the-badge&logo=python&logoColor=e08060">
<img src="https://img.shields.io/badge/Jupyter-1c1b19?style=for-the-badge&logo=jupyter&logoColor=e08060">
</p>

#### Nix-shell.

<p align="justify"> I work inside an isolated nix-shell whenever possible to keep my main system neat. I have configured this nix-shell flake to spin up different environments depending on command.</p>

#### Usage.

#### To add on new environements
```nix
# example (simple rust)
rust = pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt 
    ];
};

# example (nodejs)
node = pkgs.mkShell {
  packages = with pkgs; [ 
    nodejs
    pnpm
    ];
};
```

#### **To do.**
- [x] add Jupyter (Python).
- [x] add C/C++.
- [ ] add data-science workflow env.
