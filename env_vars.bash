#!/bin/sh

# get conda paths
export ACTIVATE_PATH=$CONDA_PREFIX/etc/conda/activate.d
export DEACTIVATE_PATH=$CONDA_PREFIX/etc/conda/deactivate.d
export ACTIVATE_SCRIPT=$ACTIVATE_PATH/env_vars.sh
export DEACTIVATE_SCRIPT=$DEACTIVATE_PATH/env_vars.sh

#delete existing activation and deactivation scripts
test -e $ACTIVATE_SCRIPT && rm $ACTIVATE_SCRIPT
test -e $DEACTIVATE_SCRIPT && rm $DEACTIVATE_SCRIPT

#create new activation script
mkdir -p $ACTIVATE_PATH
touch $ACTIVATE_SCRIPT
echo "#!/bin/sh" >> $ACTIVATE_SCRIPT
echo "export QLIK_CLOUD_API_KEY=\"$(op read "op://Personal/JMB Tenant API Key/credential")\"" >> $ACTIVATE_SCRIPT

#create deactivate script
mkdir -p $DEACTIVATE_PATH
touch $DEACTIVATE_SCRIPT
echo "#!/bin/sh" >> $DEACTIVATE_SCRIPT
echo "unset QLIK_CLOUD_API_KEY" >> $DEACTIVATE_SCRIPT