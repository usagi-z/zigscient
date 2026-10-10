{
  inputs.zig.url = "github:usagi-z/zig-flake/debug";
  outputs = {zig, ...}: {
    packages =
      builtins.mapAttrs (system: zigPkgs: {
        default = zigPkgs.default.makePackage {
          pname = "zigscient";
          version = "0.18.0-dev";
          src = ./.;
          zigReleaseMode = "fast"; # or "safe" or "small"; only needed if you don't set a preferred release mode in your build.zig
          depsHash = "sha256-KHR4GRLz/fsmyLiZ7lD/HoWZwFksi74h97inplO6o6I=";
        };
      })
      zig.packages;
  };
}
