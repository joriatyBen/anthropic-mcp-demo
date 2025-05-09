 {
  description = "python venv for anthropic mcp";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pname = "python venv for anthropic mcp";
        pkgs = nixpkgs.legacyPackages."${system}";
        venvDir = ".venv";
      in
        rec {
          inherit pname;

          devShell = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              python312Packages.python
              python312Packages.python-lsp-server
              python312Packages.autopep8
              uv
            ];

            shellHook = ''
                export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH";

                if [ -d "${venvDir}" ]; then
                  echo "Skipping venv creation, '${venvDir}' already exists"
                else
                  echo "Creating new venv environment in path: '${venvDir}'"
                  python -m venv "${venvDir}"
                fi

                source "${venvDir}/bin/activate"

                exec zsh
              '';
          };
        }
    );
} 

