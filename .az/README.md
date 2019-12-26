# TODO
## switch from Azure CLI to YAML file   
Currently, the deployment is done through Azure CLI and bash scripts. 
It is worthy to try to copy directly yaml/template from deployed resources.

## Using Azure Key Vault  
Important information, environment variables such as password, are currently manaully entered into pipeline editor.

## Deployment might failed due to existed services
All service name is created with fixed given name. Previous deployed services need to be deleted in order to deploy new release.
- Purpose  
  In production, it is not wise to shutdown/delete all services and redeploy. A better approach is deploy with different name, and switch with dns/nginx when the new deployment is done.  
- Possible solution: Add $RANDOM to service name  
However, it need some work to propagate the name.  

## CI: Deployment a single VM for testing


## Automatic deployment
The deployment is done by manually triggered