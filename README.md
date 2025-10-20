You have reached a repo that is meant to be deployed from Apstra Hub. If you would still like to use this, the terraform/tofu config is in ./pack'

This Apstra Config Pack will deploy the Juniper-Validated-Design (JVD) for a 5 Stage Fabric as defined in https://www.juniper.net/documentation/us/en/software/jvd/jvd-dcfabric-5-stage/

The input parameters allow you to choose your IP, ASN, and virtual_network VNI address ranges.

To complete the deployment once it is built, you will need to:

1 - Assign your chosen systems (and onboard them from Apstra if not done already) to the blueprint.

2 - Ensure your cabling map is accurate, either by performing the "Fetch LLDP discovered data" action, or by manually updating the link names.

3 - Perform the Commit.
