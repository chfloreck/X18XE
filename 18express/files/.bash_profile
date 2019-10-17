# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

export ORACLE_SID=mydb
export ORACLE_BASE=/opt/oracle
export ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE/
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$ORACLE_HOME/bin


