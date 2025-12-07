{
  description = "Reproducible build of my project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/b134951a4c9f3c995fd7be05f3243f8ecd65d798";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-basic
          collection-latexrecommended
          collection-latexextra
          xetex
          collection-langcyrillic
          collection-langeuropean
          collection-fontsrecommended
          collection-fontsextra
          fontspec;
      };

      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [ pkgs.fira-code pkgs.fira-mono pkgs.fira-sans pkgs.dejavu_fonts ];
      };
    in
    {
      packages.x86_64-linux.default =
        pkgs.stdenv.mkDerivation {
          pname = "my-project";
          version = "1.0";

          src = ./.;

          buildInputs = [
            pkgs.bash
            tex
            pkgs.fontconfig
            pkgs.fira-code
            pkgs.fira-mono
            pkgs.fira-sans
            pkgs.dejavu_fonts
            pkgs.python312Full
            pkgs.python312Packages.pygments
          ];

          buildPhase = ''
            export FONTCONFIG_FILE=${fontsConf}
            export HOME=$(mktemp -d)  # Временный writable HOME для кэша
            mkdir -p $HOME/.cache/fontconfig

            fc-cache -fv

            rm -rf *.minted *.aux *.log *.nav *.out *.snm *.toc *.vrb

            xelatex -shell-escape -interaction=nonstopmode presentation.tex
            xelatex -shell-escape -interaction=nonstopmode presentation.tex
          '';

          installPhase = ''
            mkdir -p $out
            if [ -f presentation.pdf ]; then
              cp presentation.pdf $out/
            else
              echo "Error: presentation.pdf not found!"
              exit 1
            fi
          '';
        };
    };
}
