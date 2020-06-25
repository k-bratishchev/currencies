CT Test

Dev org setup
Clone the project to the local machine from GIT
Select the folder with Salesforce DX project:
1. Login to your Dev Hub (don't forget to enable Dev Hub in Org Setup)
`sfdx force:auth:web:login -d -a ct`

2. Create a scratch org with scratch script:
`scripts/scratch.sh dev1`

3. Enter Setup -> Custom code -> Platform Cache, and create there `CurrencyCache` Partition.

4. Return to Home page (or any other you like), click Edit Page and add `currencyRateComponent` to your page
