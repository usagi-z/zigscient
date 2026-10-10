{
  inputs.zig.url = "github:silversquirl/zig-flake";
  outputs = {zig, ...}: {
    packages =
      builtins.mapAttrs (system: zigPkgs: {
        default = zigPkgs.default.makePackage {
          pname = "zigscient";
          version = "0.18.0-dev";
          src = ./.;
          zigReleaseMode = "fast"; # or "safe" or "small"; only needed if you don't set a preferred release mode in your build.zig
          depsHash = "<fill this in from the error message>";
        };
      })
      zig.packages;
  };
}
