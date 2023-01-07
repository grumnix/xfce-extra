{
  inputs = { };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          default = xfce4-mount-plugin;

          xfce4-mount-plugin = pkgs.xfce.mkXfceDerivation {
            category = "panel-plugins";
            pname = "xfce4-mount-plugin";
            version = "1.1.5";
            sha256 = "sha256-pNIjMZQ/NAp1IYI3uxJMabCoCV+BdV0EDUXwyxBD0gg=";

            buildInputs = with pkgs; [ gtk3 xfce.libxfce4ui xfce.libxfce4util xfce.xfce4-panel xfce.xfconf ];
          };
        };
      }
    );
}
