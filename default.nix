let                                                                                                                                                                    
                                                                                                                                                                       
  pkgs = import <nixpkgs> {};                                                                                                                                          
  buildRPackage = import <nixpkgs/pkgs/development/r-modules/generic-builder.nix> pkgs.R;                                                                              
                                                                                                                                                                       
in                                                                                                                                                                     
                                                                                                                                                                       
with pkgs.rPackages;                                                                                                                                                   
                                                                                                                                                                       
{                                                                                                                                                                      
  logbuch = buildRPackage {
    name = "r-logbuch-1.1";
    src = ./.;
    propagatedBuildInputs = [ggplot2 reshape2 getopt optparse yaml];
  };
}
