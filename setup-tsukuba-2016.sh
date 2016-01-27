echo 'export PATH=$PATH:$HOME/.local/stack/:$HOME/.local/bin/' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib/' >> $HOME/.bashrc
source $HOME/.bashrc
mkdir -p $HOME/.local/bin/
mkdir -p Downloads
cd Downloads
wget https://www.stackage.org/stack/linux-x86_64-gmp4
tar xf linux-x86_64-gmp4
cp stack-1.0.2-linux-x86_64-gmp4/stack  ~/.local/bin/
stack setup
wget https://github.com/Z3Prover/z3/archive/z3-4.4.1.tar.gz
tar xf z3-4.4.1.tar.gz
cd z3-z3-4.4.1/
./configure --prefix=$HOME/.local/
cd build/
make
mkdir -p $HOME/.local/lib/python2.6/dist-packages
make install
cd $HOME
