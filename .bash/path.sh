# set common path
export WORKSPACE=$HOME/workspace
export DEV=$WORKSPACE/dev

# set GO path
export GOPATH=$DEV/go-lang
export GOBIN=$DEV/go-lang/bin

# set PATH
export PATH=$PATH:$(go env GOPATH)/bin

