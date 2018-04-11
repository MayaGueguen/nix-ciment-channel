{ stdenv, pythonPackages, radio-beam, astropy3 }:

pythonPackages.buildPythonPackage rec {
  pname = "spectral-cube";
  version = "0.4.3";
  name = "${pname}-${version}";

  propagateBuildInputs= [ pythonPackages.numpy astropy3 radio-beam ];

  preConfigure = ''
    export PYTHONPATH=$PYTHONPATH:${radio-beam}/lib/python3.6/site-packages:${astropy3}/lib/python3.6/site-packages:${pythonPackages.numpy}/lib/python3.6/site-packages
  '';

  doCheck=false;

  src = pythonPackages.fetchPypi {
    inherit pname version;
    sha256 = "057g3mzlg5cy4wg2hh3p6gssn93rs6i7pswzhldvcq4k8m8hsl3b";
  };

}