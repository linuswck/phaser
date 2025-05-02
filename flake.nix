{
  description = "ARTIQ port to the Zynq-7000 platform";
  inputs.artiq.url = "git+https://github.com/m-labs/artiq.git";
  outputs =
    {
      self,
      artiq,
    }:
    let
      pkgs = import artiq.inputs.nixpkgs {
        system = "x86_64-linux";
      };
      artiqpkgs = artiq.packages.x86_64-linux;
    in
    {
      devShell.x86_64-linux = pkgs.mkShell {
        name = "artiq-zynq-dev-shell";
        buildInputs = with pkgs; [
          artiqpkgs.artiq
          artiqpkgs.vivado
          pre-commit
        ];
      };
    };
}
