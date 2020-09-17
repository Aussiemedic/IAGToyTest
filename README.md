# SF Developer Work Sample

This test coding scenario will demonstrate a developer’s technical knowledge in
SFconfiguration, apex development and integration.

Record your progress using git commits. When you’re done, push your work up to a new
github repo where we can review it, and send us the address.

We expect this work sample to take <4 hours. Please reach out if you have any questions.
The goals of the exercise are the following:

1. Configure and load test data in custom object
2. Build an apex REST web service
3. Unit testing and evidence of a working service

Case scenario:
1. Configure a custom object Toys with the following fields:
a. Name - Text
b. Description -Text area
c. Is available - Checkbox
d. Price - Currency

2. Load the following records to the Toys object configured in the previous step.
Transform the data as necessary based on the fields configured:
Name Description Is Available Price
Robot 1 A cool toy robot! Yes 50
Bab’s Dollhouse It’s perfect for
every girl!
No 150
Lazer Gun Not scary but cute! Yes 20
Makky Doll Looks like Barbie? No 30

3. Create an Apex REST web service that will external applications to check if the toy
details and their availability. Below are the service requirements:
a. Service should be called using POST
b. The web service payload will be accepting JSON payload and payload can
handle an Array of toys inquiry
c. The response should be in a JSON format returning an HTTP code of 200
with the following output scenario:
i. Successful match (per toy record inquiry)
Status: Match found
Name: <name of the toy>
Description: <description of the toy>
Is Available: <availability of the toy>
Price: <price of the toy>
ii. No match:
Status: no toy match found
d. The code should be able to catch exception and should return an HTTP code
of 400

4. Create an apex test class for the apex web service in the previous step. Test
coverage should be at least 80%

5. Provide a screenshot of the working apex web service (success and no match) using
SF workbench
