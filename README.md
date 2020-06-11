# docusite
Docusaurus Azure DevOps pipeline that uses Azure CLI docker container for pushing to storage accounts

## Summary
This is a sample for an Azure DevOps pipeline to publish a static website to a storage account using the Azure CLI docker image.  This can be used in situations where you are using a self hosted build agent with Azure Devops and don't have access to add additional tooling but need the az cli tool.

## Instructions
1. Create a service principal in Azure that has access to the storage account (az ad sp create-for-rbac)
2. Fork this repository and add it to your Azure DevOps project
3. Create a Variable Group in your Azure ADO project that has 3 variables with the following names
   1. Tenant
   2. Name
   3. Password
4. Modify the bin/publish-website.sh script to include your storage account

These variable names are read from the ADO pipeline and passed to Docker to log the Azure CLI into Azure.  
There is a script in the bin directory that logs you into Azure and uses the az tool to push the files to a storage account.  
The Docker container has 2 bind mounts (-v): 1) for the website build files and 2) bin directory to run the script from.
