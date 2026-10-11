{
  inputs.zig.url = "github:usagi-z/zig-flake/debug";
  outputs = {zig, ...}: {
    packages =
      builtins.mapAttrs (system: zigPkgs: {
        default = zigPkgs.default.makePackage {
          pname = "zigscient";
          version = "0.18.0-dev";
          src = ./.;
          zigReleaseMode = "safe"; # or "safe" or "small"; only needed if you don't set a preferred release mode in your build.zig
          doCheck = false;
          depsHash = "sha256-KHR4GRLz/fsmyLiZ7lD/HoWZwFksi74h97inplO6o6I=";
          preBuild = ''
            export ZIG_LIB_DIR="$src/lib";
          '';
        };
      })
      zig.packages;
  };
}
