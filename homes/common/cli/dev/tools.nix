{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    # rustc
    # cargo
    # rustfmt

    # dafny
    cbqn
    # gnupg
    
    # zig
    
  ];
}
