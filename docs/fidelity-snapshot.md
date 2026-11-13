Snapshot of AWS Emulator v1.0.341 (released November 13, 2026; scores generated 2026-11-13 04:06 UTC from emulator commit 7eb5bf3). Source: https://github.com/aws/aws-emulator/releases/tag/v1.0.341, https://github.com/aws/aws-emulator/releases/download/v1.0.341/scores.json.gz, https://github.com/aws/aws-emulator-evaluation-suite/blob/main/manifest.jsonl, https://docs.aws.amazon.com/emulator/latest/userguide/fidelity.html. Fidelity changes with every release; check the releases page.

# AWS Emulator fidelity snapshot

## How to read this

- A score is the number of AWS fidelity tests the emulator passes out of the tests written for that service, such as 814 of 930. AWS checked every test against real AWS accounts first, so a failing test is a known difference from AWS.
- The control plane is the set of calls that create, describe, update, delete and list resources, such as creating an S3 bucket or a DynamoDB table. AWS says the emulator matches AWS most closely here.
- The data plane is the work the service exists to do, such as putting and getting S3 objects, sending SQS messages, invoking a Lambda function or decrypting with KMS. Data plane fidelity varies a lot by service.
- HTTP 501 with the error code `NotImplemented` means the emulator does not implement that operation at all yet, and a test that calls it fails right away. A low score is different: the operation exists, but some results or errors do not match AWS.
- A missing test is not proof of a gap, and a good score is not proof that your workflow works. Look up the operations you call in the manifest, then run your own checks against the emulator and against AWS.

## Common services

| Service | Overall score | Control plane | Data plane | CloudFormation / Terraform / CDK |
|---|---|---|---|---|
| S3 (`s3`) | 814 of 930 (88%) | 154 of 165 (93%) | 264 of 327 (81%) | `cloudformation__s3` group: 44 of 61 (72%) |
| DynamoDB (`dynamodb`) | 829 of 1073 (77%) | 135 of 193 (70%) | 529 of 711 (74%) | `cloudformation__dynamodb` group: 5 of 19 (26%) |
| SQS (`sqs`) | 286 of 306 (93%) | 81 of 87 (93%) | 217 of 232 (94%) | `cloudformation__sqs` group: 7 of 29 (24%) |
| SNS (`sns`) | 212 of 245 (87%) | 112 of 124 (90%) | 102 of 124 (82%) | `cloudformation__sns` group: 2 of 10 (20%) |
| Lambda (`lambda`) | 297 of 617 (48%) | 134 of 187 (72%) | 144 of 430 (33%) | `cloudformation__lambda` group: 28 of 48 (58%) |
| IAM (`iam`) | 371 of 463 (80%) | 357 of 446 (80%) | 1 of 1 (100%) | `cloudformation__iam` group: 4 of 14 (29%) |
| STS (`sts`) | 82 of 145 (57%) | 77 of 125 (62%) | 5 of 21 (24%) | not published (no CloudFormation tests for this service) |
| Secrets Manager (`secretsmanager`) | 155 of 194 (80%) | 70 of 93 (75%) | 89 of 109 (82%) | `cloudformation__secretsmanager` group: 0 of 5 (0%) |
| SSM (all of Systems Manager) (`ssm`) | 82 of 282 (29%) | 48 of 195 (25%) | 29 of 76 (38%) | `cloudformation__ssm` group: 20 of 43 (47%) |
| EventBridge (`events`) | 176 of 204 (86%) | 131 of 142 (92%) | 45 of 62 (73%) | `cloudformation__events` group: 0 of 7 (0%) |
| Step Functions (`stepfunctions`) | 406 of 521 (78%) | 122 of 164 (74%) | 288 of 365 (79%) | `cloudformation__stepfunctions` group: 20 of 26 (77%) |
| KMS (`kms`) | 233 of 241 (97%) | 119 of 123 (97%) | 116 of 121 (96%) | `cloudformation__kms` group: 0 of 4 (0%) |
| CloudWatch Logs (`logs`) | 371 of 460 (81%) | 229 of 260 (88%) | 131 of 195 (67%) | `cloudformation__logs` group: 4 of 23 (17%) |
| Kinesis Data Streams (`kinesis`) | 156 of 224 (70%) | 97 of 121 (80%) | 51 of 95 (54%) | `cloudformation__kinesis` group: 0 of 7 (0%) |
| API Gateway (REST, v1) (`apigateway`) | 451 of 580 (78%) | 393 of 481 (82%) | 57 of 101 (56%) | `apigateway__cloudformation` group: 4 of 20 (20%) |
| API Gateway (HTTP and WebSocket, v2) (`apigatewayv2`) | 127 of 173 (73%) | 99 of 113 (88%) | 30 of 63 (48%) | `apigatewayv2__cloudformation` group: 3 of 13 (23%) |
| CloudFormation (stack operations) (`cloudformation`) | 356 of 451 (79%) | 306 of 384 (80%) | 15 of 30 (50%) | Not applicable (this row is CloudFormation itself) |
| CloudWatch (metrics and alarms) (`cloudwatch`) | 556 of 696 (80%) | 307 of 411 (75%) | 198 of 233 (85%) | `cloudformation__cloudwatch` group: 1 of 13 (8%) |
| EC2 (`ec2`) | 613 of 1302 (47%) | 468 of 1004 (47%) | 2 of 60 (3%) | `cloudformation__ec2` group: 15 of 76 (20%) |
| ECS (`ecs`) | 306 of 480 (64%) | 210 of 302 (70%) | 37 of 109 (34%) | `cloudformation__ecs` group: 0 of 12 (0%) |
| ECR (`ecr`) | 186 of 214 (87%) | 108 of 123 (88%) | 68 of 80 (85%) | `cloudformation__ecr` group: 1 of 10 (10%) |
| EKS (`eks`) | 215 of 311 (69%) | 186 of 240 (78%) | 0 of 35 (0%) | `cloudformation__eks` group: 0 of 3 (0%) |
| RDS (`rds`) | 211 of 384 (55%) | 184 of 288 (64%) | 2 of 4 (50%) | `cloudformation__rds` group: 0 of 9 (0%) |
| Cognito user pools (`cognito-idp`) | 487 of 604 (81%) | 398 of 449 (89%) | 76 of 134 (57%) | `cloudformation__cognito-idp` group: 1 of 11 (9%) |
| Firehose (`firehose`) | 171 of 175 (98%) | 92 of 95 (97%) | 81 of 82 (99%) | not published (no CloudFormation tests for this service) |
| Route 53 (`route53`) | 84 of 114 (74%) | 76 of 104 (73%) | 8 of 10 (80%) | `cloudformation__route53` group: 4 of 6 (67%) |
| Bedrock Runtime (`bedrock-runtime`) | 38 of 85 (45%) | 5 of 8 (62%) | 33 of 77 (43%) | not published (no CloudFormation tests for this service) |

SSM Parameter Store: AWS does not publish a separate Parameter Store score. Of the `ssm` tests in the public manifest that call GetParameter, GetParameters, GetParametersByPath or PutParameter, 48 of 126 pass. Some of those tests also use other Systems Manager features, so a failure is not always a Parameter Store failure.

Terraform: the fidelity test manifest contains no Terraform tests, so Terraform support is not published for any service. The CloudFormation column shows the score of the tests AWS files under `cloudformation__<service>`. Some of those tests deploy with the AWS CDK or AWS SAM, which both run through CloudFormation. AWS publishes no separate CDK score.

## How the columns were built

- Overall score: from the `scores.json.gz` asset on the v1.0.341 release. Only `behavioral` units count, because those are the fidelity tests the AWS docs describe. Each test belongs to the service named before the dot in its ID, which is how the AWS runner groups scores by service. Skipped tests are left out, as the runner does.
- Control plane and data plane: AWS does not print these as separate numbers. They come from joining each test result to its `plane:control` or `plane:data` label in the public manifest (suite version v1.0.0, November 11, 2026). Label meanings are in https://github.com/aws/aws-emulator-evaluation-suite/blob/main/docs/TAXONOMY.md.
- The two plane columns do not add up to the overall score. A test can carry both labels, and newer tests in the release scores are not yet in the public manifest, so they have no plane label.
- The release asset also holds 10,709 `wire` units, which the AWS docs do not describe. They are not counted here.
- Across every service, the emulator passes 21,857 of 32,756 behavioral fidelity tests in this release, with 83 skipped. Control plane: 13,631 of 19,399. Data plane: 6,274 of 10,718.

## All other single services with a published score

Cross-service tests (IDs such as `apigateway__lambda`) are left out of this list. Their results are in the release asset.

| Service key | Overall score | Control plane | Data plane |
|---|---|---|---|
| `accessanalyzer` | 23 of 25 (92%) | 23 of 25 (92%) | not published |
| `account` | 21 of 22 (95%) | 20 of 20 (100%) | not published |
| `acm` | 234 of 252 (93%) | 209 of 225 (93%) | 25 of 27 (93%) |
| `acm-pca` | 97 of 124 (78%) | 75 of 87 (86%) | 22 of 37 (59%) |
| `agent-registry` | 3 of 12 (25%) | not published | 3 of 12 (25%) |
| `agent-registry-control` | 3 of 18 (17%) | 3 of 18 (17%) | not published |
| `aiops` | 21 of 21 (100%) | 21 of 21 (100%) | not published |
| `amp` | 21 of 22 (95%) | 20 of 21 (95%) | 1 of 1 (100%) |
| `amplify` | 22 of 34 (65%) | 13 of 16 (81%) | 2 of 3 (67%) |
| `amplifybackend` | 15 of 15 (100%) | 15 of 15 (100%) | not published |
| `amplifyuibuilder` | 21 of 21 (100%) | 21 of 21 (100%) | not published |
| `apigatewaymanagementapi` | 0 of 29 (0%) | not published | 0 of 29 (0%) |
| `appconfig` | 196 of 220 (89%) | 184 of 203 (91%) | 14 of 19 (74%) |
| `appconfigdata` | 41 of 41 (100%) | 1 of 1 (100%) | 41 of 41 (100%) |
| `appfabric` | 22 of 23 (96%) | 21 of 22 (95%) | not published |
| `appflow` | 17 of 20 (85%) | 15 of 18 (83%) | 2 of 3 (67%) |
| `appintegrations` | 17 of 19 (89%) | 17 of 19 (89%) | not published |
| `application-autoscaling` | 114 of 126 (90%) | 100 of 105 (95%) | 16 of 23 (70%) |
| `application-insights` | 0 of 2 (0%) | 0 of 2 (0%) | not published |
| `application-signals` | 24 of 24 (100%) | 21 of 21 (100%) | 3 of 3 (100%) |
| `appstream` | 17 of 24 (71%) | 17 of 24 (71%) | 1 of 1 (100%) |
| `appsync` | 188 of 328 (57%) | 186 of 254 (73%) | 2 of 77 (3%) |
| `arc-region-switch` | 20 of 20 (100%) | 13 of 13 (100%) | 7 of 7 (100%) |
| `arc-zonal-shift` | 8 of 23 (35%) | 8 of 23 (35%) | not published |
| `artifact` | 22 of 23 (96%) | 20 of 21 (95%) | 2 of 2 (100%) |
| `athena` | 90 of 306 (29%) | 36 of 183 (20%) | 54 of 123 (44%) |
| `autoscaling` | 73 of 264 (28%) | 69 of 243 (28%) | 6 of 27 (22%) |
| `autoscaling-plans` | 4 of 10 (40%) | 4 of 10 (40%) | not published |
| `b2bi` | 42 of 42 (100%) | 28 of 28 (100%) | 14 of 14 (100%) |
| `backup` | 27 of 51 (53%) | 25 of 46 (54%) | 3 of 6 (50%) |
| `backup-gateway` | 19 of 19 (100%) | 19 of 19 (100%) | not published |
| `backupsearch` | 24 of 24 (100%) | 18 of 18 (100%) | 6 of 6 (100%) |
| `batch` | 153 of 233 (66%) | 136 of 166 (82%) | 17 of 68 (25%) |
| `bcm-dashboards` | 25 of 26 (96%) | 25 of 26 (96%) | not published |
| `bcm-data-exports` | 21 of 21 (100%) | 21 of 21 (100%) | not published |
| `bcm-pricing-calculator` | 12 of 13 (92%) | 12 of 13 (92%) | not published |
| `bcm-recommended-actions` | 45 of 47 (96%) | 30 of 32 (94%) | 15 of 15 (100%) |
| `bedrock` | 155 of 191 (81%) | 114 of 130 (88%) | 41 of 60 (68%) |
| `bedrock-agent` | 19 of 55 (35%) | 13 of 40 (32%) | 2 of 3 (67%) |
| `bedrock-agent-runtime` | 82 of 111 (74%) | 50 of 60 (83%) | 32 of 48 (67%) |
| `bedrock-agentcore` | 22 of 64 (34%) | 9 of 27 (33%) | 13 of 37 (35%) |
| `bedrock-agentcore-control` | 46 of 114 (40%) | 44 of 108 (41%) | 2 of 6 (33%) |
| `bedrock-data-automation` | 34 of 45 (76%) | 33 of 39 (85%) | 1 of 6 (17%) |
| `bedrock-data-automation-runtime` | 15 of 16 (94%) | 7 of 7 (100%) | 8 of 9 (89%) |
| `billing` | 18 of 19 (95%) | 16 of 17 (94%) | 2 of 2 (100%) |
| `billingconductor` | 18 of 18 (100%) | 18 of 18 (100%) | not published |
| `braket` | 14 of 14 (100%) | 12 of 12 (100%) | 2 of 2 (100%) |
| `budgets` | 24 of 25 (96%) | 24 of 25 (96%) | not published |
| `ce` | 3 of 5 (60%) | 3 of 5 (60%) | not published |
| `chatbot` | 41 of 42 (98%) | 41 of 42 (98%) | not published |
| `chime-sdk-identity` | 23 of 24 (96%) | 23 of 24 (96%) | not published |
| `chime-sdk-media-pipelines` | 16 of 22 (73%) | 16 of 22 (73%) | not published |
| `chime-sdk-meetings` | 19 of 25 (76%) | 19 of 24 (79%) | 0 of 1 (0%) |
| `chime-sdk-messaging` | 12 of 12 (100%) | not published | 12 of 12 (100%) |
| `cleanrooms` | 13 of 22 (59%) | 12 of 19 (63%) | 1 of 3 (33%) |
| `cleanroomsml` | 3 of 4 (75%) | 3 of 4 (75%) | not published |
| `cloudcontrol` | 93 of 156 (60%) | 89 of 141 (63%) | 4 of 15 (27%) |
| `cloudfront` | 320 of 424 (75%) | 272 of 343 (79%) | 18 of 43 (42%) |
| `cloudfront-keyvaluestore` | 0 of 46 (0%) | 0 of 2 (0%) | 0 of 45 (0%) |
| `cloudhsmv2` | 0 of 2 (0%) | 0 of 2 (0%) | not published |
| `cloudtrail` | 83 of 101 (82%) | 64 of 77 (83%) | 19 of 24 (79%) |
| `cloudtrail-data` | 18 of 19 (95%) | 1 of 2 (50%) | 17 of 18 (94%) |
| `cloudwatchomni` | 3 of 34 (9%) | 3 of 27 (11%) | 0 of 7 (0%) |
| `codeartifact` | 68 of 95 (72%) | 49 of 51 (96%) | 19 of 45 (42%) |
| `codebuild` | 106 of 146 (73%) | 65 of 72 (90%) | 26 of 54 (48%) |
| `codecommit` | 122 of 145 (84%) | 51 of 59 (86%) | 71 of 86 (83%) |
| `codeconnections` | 45 of 45 (100%) | 45 of 45 (100%) | not published |
| `codedeploy` | 109 of 139 (78%) | 106 of 121 (88%) | 3 of 18 (17%) |
| `codeguruprofiler` | 78 of 80 (98%) | 74 of 74 (100%) | 4 of 6 (67%) |
| `codepipeline` | 151 of 164 (92%) | 55 of 59 (93%) | 97 of 106 (92%) |
| `codestar-connections` | 36 of 45 (80%) | 36 of 45 (80%) | not published |
| `codestar-notifications` | 20 of 23 (87%) | 20 of 23 (87%) | not published |
| `cognito-identity` | 243 of 281 (86%) | 213 of 240 (89%) | 30 of 41 (73%) |
| `comprehend` | 63 of 66 (95%) | 16 of 16 (100%) | 47 of 50 (94%) |
| `comprehendmedical` | 12 of 21 (57%) | 4 of 5 (80%) | 8 of 16 (50%) |
| `compute-optimizer` | 25 of 25 (100%) | 25 of 25 (100%) | not published |
| `compute-optimizer-automation` | 18 of 20 (90%) | 18 of 20 (90%) | not published |
| `config` | 130 of 162 (80%) | 85 of 109 (78%) | 31 of 39 (79%) |
| `connect` | 0 of 2 (0%) | 0 of 2 (0%) | not published |
| `connect-contact-lens` | 14 of 14 (100%) | 13 of 13 (100%) | 1 of 1 (100%) |
| `connectcampaigns` | 39 of 62 (63%) | 30 of 53 (57%) | 9 of 9 (100%) |
| `connectcampaignsv2` | 9 of 25 (36%) | 9 of 23 (39%) | 0 of 3 (0%) |
| `connectcases` | 14 of 22 (64%) | 6 of 10 (60%) | 8 of 12 (67%) |
| `connecthealth` | 15 of 24 (62%) | 15 of 20 (75%) | 0 of 6 (0%) |
| `connectparticipant` | 7 of 17 (41%) | 1 of 2 (50%) | 6 of 15 (40%) |
| `controlcatalog` | 63 of 65 (97%) | 63 of 65 (97%) | not published |
| `controltower` | 14 of 15 (93%) | 14 of 15 (93%) | not published |
| `cost-optimization-hub` | 15 of 17 (88%) | 14 of 16 (88%) | 1 of 1 (100%) |
| `cur` | 6 of 6 (100%) | 6 of 6 (100%) | not published |
| `customer-profiles` | 24 of 45 (53%) | 5 of 8 (62%) | 7 of 14 (50%) |
| `databrew` | 7 of 7 (100%) | 4 of 4 (100%) | 3 of 3 (100%) |
| `dataexchange` | 20 of 25 (80%) | 12 of 12 (100%) | 8 of 13 (62%) |
| `datasync` | 2 of 12 (17%) | 2 of 7 (29%) | 0 of 5 (0%) |
| `datazone` | 19 of 25 (76%) | 19 of 24 (79%) | not published |
| `dax` | 5 of 21 (24%) | 5 of 21 (24%) | not published |
| `deadline` | 11 of 22 (50%) | 11 of 22 (50%) | not published |
| `detective` | 38 of 38 (100%) | 38 of 38 (100%) | not published |
| `devicefarm` | 4 of 4 (100%) | 3 of 3 (100%) | 1 of 1 (100%) |
| `devops-agent` | 9 of 11 (82%) | 1 of 1 (100%) | 8 of 10 (80%) |
| `dlm` | 19 of 21 (90%) | 19 of 21 (90%) | not published |
| `dms` | 1 of 3 (33%) | 1 of 2 (50%) | 0 of 1 (0%) |
| `docdb` | 3 of 8 (38%) | 3 of 3 (100%) | 0 of 1 (0%) |
| `docdb-elastic` | 28 of 38 (74%) | 28 of 38 (74%) | not published |
| `drs` | 0 of 15 (0%) | 0 of 15 (0%) | not published |
| `ds` | 127 of 157 (81%) | 111 of 136 (82%) | 10 of 11 (91%) |
| `ds-data` | 7 of 7 (100%) | not published | 7 of 7 (100%) |
| `dsql` | 38 of 49 (78%) | 38 of 40 (95%) | 0 of 10 (0%) |
| `dynamodbstreams` | 15 of 16 (94%) | 1 of 1 (100%) | 14 of 15 (93%) |
| `ebs` | 27 of 29 (93%) | 6 of 6 (100%) | 21 of 23 (91%) |
| `ec2-instance-connect` | 4 of 4 (100%) | 2 of 2 (100%) | 2 of 2 (100%) |
| `ecr-public` | 84 of 91 (92%) | 55 of 59 (93%) | 30 of 33 (91%) |
| `efs` | 21 of 26 (81%) | 19 of 23 (83%) | not published |
| `eks-auth` | 9 of 21 (43%) | 9 of 10 (90%) | 0 of 11 (0%) |
| `elasticache` | 85 of 156 (54%) | 85 of 128 (66%) | 0 of 22 (0%) |
| `elasticbeanstalk` | 114 of 173 (66%) | 109 of 152 (72%) | 5 of 23 (22%) |
| `elb` | 9 of 17 (53%) | 9 of 11 (82%) | 0 of 6 (0%) |
| `elbv2` | 202 of 303 (67%) | 188 of 240 (78%) | 11 of 65 (17%) |
| `elementalinference` | 27 of 30 (90%) | 25 of 26 (96%) | 2 of 4 (50%) |
| `emr` | 118 of 220 (54%) | 95 of 144 (66%) | 5 of 44 (11%) |
| `emr-containers` | 17 of 20 (85%) | 15 of 18 (83%) | 2 of 2 (100%) |
| `emr-serverless` | 38 of 43 (88%) | 37 of 38 (97%) | 2 of 6 (33%) |
| `endusermessaging` | 2 of 49 (4%) | 2 of 45 (4%) | 0 of 4 (0%) |
| `entityresolution` | 21 of 22 (95%) | 19 of 19 (100%) | 2 of 3 (67%) |
| `es` | 7 of 9 (78%) | 7 of 7 (100%) | 0 of 2 (0%) |
| `eventbridgev2` | 2 of 17 (12%) | 2 of 16 (12%) | 0 of 2 (0%) |
| `evs` | 19 of 20 (95%) | 19 of 20 (95%) | not published |
| `fis` | 49 of 51 (96%) | 39 of 39 (100%) | 10 of 12 (83%) |
| `fms` | 22 of 24 (92%) | 21 of 23 (91%) | not published |
| `freetier` | 33 of 33 (100%) | 30 of 30 (100%) | 2 of 2 (100%) |
| `fsx` | 3 of 3 (100%) | 3 of 3 (100%) | not published |
| `gamelift` | 25 of 27 (93%) | 25 of 27 (93%) | not published |
| `gameliftstreams` | 28 of 35 (80%) | 28 of 35 (80%) | not published |
| `geo-maps` | 18 of 24 (75%) | not published | 18 of 24 (75%) |
| `geo-places` | 23 of 23 (100%) | not published | 23 of 23 (100%) |
| `geo-routes` | 60 of 62 (97%) | not published | 60 of 62 (97%) |
| `globalaccelerator` | 2 of 8 (25%) | 2 of 8 (25%) | not published |
| `glue` | 231 of 324 (71%) | 161 of 218 (74%) | 34 of 62 (55%) |
| `grafana` | 19 of 19 (100%) | 18 of 18 (100%) | 2 of 2 (100%) |
| `greengrassv2` | 28 of 68 (41%) | 28 of 68 (41%) | not published |
| `groundstation` | 16 of 20 (80%) | 16 of 20 (80%) | not published |
| `guardduty` | 65 of 79 (82%) | 52 of 65 (80%) | 11 of 12 (92%) |
| `healthlake` | 13 of 20 (65%) | 11 of 13 (85%) | 2 of 7 (29%) |
| `identitystore` | 78 of 83 (94%) | 78 of 83 (94%) | not published |
| `imagebuilder` | 33 of 67 (49%) | 18 of 46 (39%) | 0 of 2 (0%) |
| `inspector-scan` | 15 of 21 (71%) | not published | 15 of 21 (71%) |
| `inspector2` | 10 of 25 (40%) | 10 of 25 (40%) | not published |
| `interconnect` | 15 of 15 (100%) | 15 of 15 (100%) | not published |
| `internetmonitor` | 21 of 21 (100%) | 18 of 18 (100%) | 3 of 3 (100%) |
| `invoicing` | 21 of 21 (100%) | 21 of 21 (100%) | not published |
| `iot` | 48 of 215 (22%) | 25 of 163 (15%) | 19 of 32 (59%) |
| `iot-data` | 11 of 13 (85%) | not published | 11 of 13 (85%) |
| `iot-jobs-data` | 9 of 9 (100%) | not published | 9 of 9 (100%) |
| `iot-managed-integrations` | 13 of 22 (59%) | 13 of 22 (59%) | not published |
| `iotdeviceadvisor` | 12 of 20 (60%) | 12 of 19 (63%) | 0 of 1 (0%) |
| `iotsecuretunneling` | 18 of 18 (100%) | 18 of 18 (100%) | not published |
| `iotsitewise` | 67 of 87 (77%) | 31 of 39 (79%) | 20 of 21 (95%) |
| `iottwinmaker` | 22 of 22 (100%) | 17 of 17 (100%) | 5 of 5 (100%) |
| `iotwireless` | 7 of 8 (88%) | 7 of 8 (88%) | not published |
| `ivs` | 63 of 76 (83%) | 62 of 75 (83%) | 1 of 1 (100%) |
| `ivs-realtime` | 65 of 69 (94%) | 65 of 69 (94%) | not published |
| `ivschat` | 15 of 15 (100%) | 15 of 15 (100%) | not published |
| `kafka` | 119 of 222 (54%) | 119 of 197 (60%) | 0 of 3 (0%) |
| `kafkaconnect` | 12 of 18 (67%) | 12 of 17 (71%) | 0 of 1 (0%) |
| `keyspaces` | 18 of 23 (78%) | 18 of 18 (100%) | 0 of 5 (0%) |
| `keyspacesstreams` | 14 of 20 (70%) | 9 of 9 (100%) | 5 of 11 (45%) |
| `kinesis-video-archived-media` | 18 of 20 (90%) | not published | 18 of 20 (90%) |
| `kinesis-video-media` | 7 of 16 (44%) | not published | 7 of 16 (44%) |
| `kinesis-video-signaling` | 15 of 15 (100%) | 3 of 3 (100%) | 12 of 12 (100%) |
| `kinesis-video-webrtc-storage` | 4 of 19 (21%) | 3 of 8 (38%) | 1 of 11 (9%) |
| `kinesisanalyticsv2` | 9 of 20 (45%) | 2 of 3 (67%) | not published |
| `kinesisvideo` | 21 of 25 (84%) | 1 of 1 (100%) | 20 of 24 (83%) |
| `lambda-core` | 25 of 28 (89%) | 25 of 28 (89%) | not published |
| `lambda-microvms` | 25 of 40 (62%) | 20 of 29 (69%) | 5 of 11 (45%) |
| `lambda-web` | 10 of 16 (62%) | 10 of 13 (77%) | 0 of 3 (0%) |
| `launch-wizard` | 19 of 19 (100%) | 19 of 19 (100%) | not published |
| `lexv2-models` | 5 of 9 (56%) | 5 of 8 (62%) | 0 of 1 (0%) |
| `lexv2-runtime` | 10 of 10 (100%) | not published | 10 of 10 (100%) |
| `license-manager` | 7 of 7 (100%) | 7 of 7 (100%) | not published |
| `license-manager-linux-subscriptions` | 16 of 16 (100%) | 16 of 16 (100%) | not published |
| `license-manager-user-subscriptions` | 18 of 18 (100%) | 18 of 18 (100%) | not published |
| `lightsail` | 20 of 24 (83%) | 19 of 22 (86%) | 1 of 3 (33%) |
| `location` | 6 of 12 (50%) | 2 of 4 (50%) | 4 of 8 (50%) |
| `macie2` | 8 of 22 (36%) | 8 of 18 (44%) | 0 of 4 (0%) |
| `mailmanager` | 3 of 8 (38%) | 3 of 8 (38%) | not published |
| `marketplace-agreement` | 15 of 18 (83%) | 15 of 18 (83%) | not published |
| `marketplace-catalog` | 25 of 25 (100%) | 25 of 25 (100%) | not published |
| `marketplace-deployment` | 2 of 6 (33%) | 2 of 6 (33%) | not published |
| `marketplace-discovery` | 78 of 78 (100%) | 62 of 62 (100%) | 16 of 16 (100%) |
| `marketplace-reporting` | 17 of 17 (100%) | 17 of 17 (100%) | not published |
| `mediaconnect` | 15 of 28 (54%) | 15 of 24 (62%) | 0 of 4 (0%) |
| `mediaconvert` | 20 of 25 (80%) | 17 of 21 (81%) | 3 of 5 (60%) |
| `medialive` | 30 of 49 (61%) | 17 of 19 (89%) | 0 of 1 (0%) |
| `mediapackage` | 52 of 58 (90%) | 52 of 52 (100%) | 0 of 6 (0%) |
| `mediapackage-vod` | 20 of 22 (91%) | 20 of 21 (95%) | 0 of 1 (0%) |
| `mediapackagev2` | 65 of 66 (98%) | 64 of 64 (100%) | 1 of 2 (50%) |
| `mediatailor` | 5 of 7 (71%) | 5 of 7 (71%) | not published |
| `medical-imaging` | 18 of 18 (100%) | 12 of 12 (100%) | 6 of 6 (100%) |
| `memorydb` | 16 of 20 (80%) | 16 of 20 (80%) | 0 of 2 (0%) |
| `mgn` | 11 of 21 (52%) | 11 of 21 (52%) | not published |
| `mpa` | 19 of 19 (100%) | 19 of 19 (100%) | not published |
| `mq` | 12 of 23 (52%) | 12 of 20 (60%) | not published |
| `mwaa` | 13 of 19 (68%) | 11 of 16 (69%) | 2 of 3 (67%) |
| `mwaa-serverless` | 15 of 23 (65%) | 13 of 15 (87%) | 2 of 8 (25%) |
| `neptune` | 1 of 1 (100%) | 1 of 1 (100%) | not published |
| `neptune-graph` | 20 of 36 (56%) | 20 of 22 (91%) | 0 of 5 (0%) |
| `neptunedata` | 0 of 19 (0%) | not published | not published |
| `network-firewall` | 24 of 25 (96%) | 21 of 21 (100%) | 0 of 1 (0%) |
| `network-security-manager` | 0 of 6 (0%) | 0 of 6 (0%) | not published |
| `networkflowmonitor` | 24 of 25 (96%) | 21 of 22 (95%) | 3 of 3 (100%) |
| `networkmanager` | 23 of 24 (96%) | 23 of 24 (96%) | not published |
| `networkmonitor` | 40 of 41 (98%) | 40 of 40 (100%) | 0 of 1 (0%) |
| `notifications` | 24 of 26 (92%) | 24 of 25 (96%) | 0 of 1 (0%) |
| `notificationscontacts` | 20 of 20 (100%) | 20 of 20 (100%) | not published |
| `nova-act` | 15 of 22 (68%) | 15 of 21 (71%) | 0 of 1 (0%) |
| `oam` | 23 of 23 (100%) | 23 of 23 (100%) | not published |
| `observabilityadmin` | 16 of 18 (89%) | 14 of 16 (88%) | 2 of 2 (100%) |
| `omics` | 8 of 22 (36%) | 8 of 16 (50%) | 0 of 6 (0%) |
| `opensearch` | 169 of 269 (63%) | 152 of 206 (74%) | 10 of 56 (18%) |
| `opensearchserverless` | 49 of 59 (83%) | 49 of 55 (89%) | 0 of 1 (0%) |
| `osis` | 14 of 22 (64%) | 14 of 21 (67%) | 0 of 1 (0%) |
| `outposts` | 25 of 25 (100%) | 25 of 25 (100%) | not published |
| `partnercentral-account` | 2 of 16 (12%) | 2 of 16 (12%) | not published |
| `partnercentral-benefits` | 20 of 20 (100%) | 20 of 20 (100%) | not published |
| `partnercentral-channel` | 0 of 20 (0%) | 0 of 20 (0%) | not published |
| `payment-cryptography` | 11 of 21 (52%) | 11 of 20 (55%) | 0 of 1 (0%) |
| `payment-cryptography-data` | 8 of 21 (38%) | not published | 8 of 21 (38%) |
| `pca-connector-ad` | 4 of 15 (27%) | 4 of 15 (27%) | not published |
| `pca-connector-scep` | 16 of 21 (76%) | 15 of 20 (75%) | 1 of 1 (100%) |
| `pcs` | 11 of 13 (85%) | 11 of 13 (85%) | not published |
| `personalize` | 2 of 2 (100%) | 2 of 2 (100%) | not published |
| `personalize-events` | 8 of 19 (42%) | not published | 8 of 19 (42%) |
| `personalize-runtime` | 10 of 14 (71%) | not published | 10 of 14 (71%) |
| `pi` | 17 of 20 (85%) | 12 of 14 (86%) | 5 of 5 (100%) |
| `pinpoint` | 1 of 6 (17%) | 1 of 4 (25%) | 0 of 2 (0%) |
| `pinpoint-sms-voice` | 16 of 17 (94%) | 14 of 15 (93%) | 2 of 2 (100%) |
| `pinpoint-sms-voice-v2` | 0 of 8 (0%) | 0 of 8 (0%) | not published |
| `pipes` | 86 of 96 (90%) | 56 of 61 (92%) | 30 of 35 (86%) |
| `polly` | 52 of 52 (100%) | 22 of 22 (100%) | 30 of 30 (100%) |
| `pricing` | 24 of 30 (80%) | 21 of 21 (100%) | 1 of 1 (100%) |
| `pricing-plan-manager` | 0 of 2 (0%) | 0 of 2 (0%) | not published |
| `qconnect` | 17 of 25 (68%) | 12 of 19 (63%) | 5 of 6 (83%) |
| `quicksight` | 9 of 20 (45%) | 9 of 20 (45%) | not published |
| `ram` | 7 of 12 (58%) | 7 of 12 (58%) | not published |
| `rbin` | 18 of 19 (95%) | 18 of 19 (95%) | not published |
| `rds-data` | 28 of 37 (76%) | not published | 27 of 36 (75%) |
| `redshift` | 94 of 187 (50%) | 83 of 142 (58%) | 5 of 27 (19%) |
| `redshift-data` | 17 of 24 (71%) | not published | 17 of 24 (71%) |
| `redshift-serverless` | 4 of 5 (80%) | 4 of 5 (80%) | not published |
| `rekognition` | 15 of 24 (62%) | 7 of 12 (58%) | 8 of 12 (67%) |
| `resiliencehub` | 11 of 11 (100%) | 9 of 9 (100%) | 2 of 2 (100%) |
| `resiliencehubv2` | 2 of 35 (6%) | 2 of 35 (6%) | not published |
| `resource-explorer-2` | 19 of 21 (90%) | 18 of 20 (90%) | 1 of 1 (100%) |
| `resource-groups` | 13 of 20 (65%) | 13 of 15 (87%) | 0 of 5 (0%) |
| `resourcegroupstaggingapi` | 13 of 13 (100%) | not published | 13 of 13 (100%) |
| `rolesanywhere` | 14 of 26 (54%) | 14 of 24 (58%) | 0 of 2 (0%) |
| `route53-recovery-cluster` | 0 of 17 (0%) | 0 of 2 (0%) | 0 of 15 (0%) |
| `route53-recovery-control-config` | 17 of 21 (81%) | 17 of 20 (85%) | 0 of 2 (0%) |
| `route53domains` | 0 of 5 (0%) | 0 of 5 (0%) | not published |
| `route53globalresolver` | 0 of 5 (0%) | 0 of 5 (0%) | not published |
| `route53profiles` | 14 of 19 (74%) | 14 of 18 (78%) | 0 of 1 (0%) |
| `route53resolver` | 100 of 134 (75%) | 100 of 129 (78%) | 0 of 5 (0%) |
| `rtbfabric` | 2 of 10 (20%) | 2 of 10 (20%) | not published |
| `rum` | 70 of 81 (86%) | 62 of 68 (91%) | 8 of 13 (62%) |
| `s3control` | 24 of 35 (69%) | 19 of 23 (83%) | 5 of 12 (42%) |
| `s3files` | 14 of 23 (61%) | 14 of 23 (61%) | not published |
| `s3outposts` | 9 of 13 (69%) | 9 of 13 (69%) | not published |
| `s3tables` | 56 of 139 (40%) | 43 of 110 (39%) | not published |
| `s3vectors` | 81 of 84 (96%) | 28 of 28 (100%) | 25 of 26 (96%) |
| `sagemaker` | 256 of 338 (76%) | 248 of 312 (79%) | 9 of 32 (28%) |
| `sagemaker-featurestore-runtime` | 27 of 27 (100%) | not published | 27 of 27 (100%) |
| `sagemaker-metrics` | 16 of 19 (84%) | not published | 16 of 19 (84%) |
| `sagemaker-runtime` | 7 of 8 (88%) | not published | 7 of 8 (88%) |
| `sagemakerjobruntime` | 14 of 14 (100%) | not published | 14 of 14 (100%) |
| `sagemakertrainingsessionruntime` | 0 of 16 (0%) | not published | 0 of 16 (0%) |
| `savingsplans` | 21 of 21 (100%) | 21 of 21 (100%) | not published |
| `scheduler` | 96 of 120 (80%) | 57 of 70 (81%) | 39 of 52 (75%) |
| `schemas` | 25 of 26 (96%) | 23 of 23 (100%) | 2 of 3 (67%) |
| `securityagent` | 19 of 22 (86%) | 16 of 18 (89%) | 3 of 4 (75%) |
| `securityhub` | 20 of 21 (95%) | 11 of 12 (92%) | 9 of 9 (100%) |
| `securitylake` | 3 of 3 (100%) | 3 of 3 (100%) | not published |
| `serverlessrepo` | 9 of 9 (100%) | 8 of 8 (100%) | 1 of 1 (100%) |
| `service-quotas` | 38 of 40 (95%) | 38 of 40 (95%) | not published |
| `servicecatalog` | 2 of 9 (22%) | 2 of 4 (50%) | 0 of 5 (0%) |
| `servicediscovery` | 58 of 74 (78%) | 49 of 62 (79%) | 9 of 12 (75%) |
| `ses` | 106 of 120 (88%) | 96 of 104 (92%) | 11 of 17 (65%) |
| `sesv2` | 94 of 121 (78%) | 78 of 93 (84%) | 15 of 27 (56%) |
| `shield` | 15 of 18 (83%) | 15 of 18 (83%) | not published |
| `signer` | 30 of 40 (75%) | 17 of 23 (74%) | 13 of 17 (76%) |
| `signer-data` | 1 of 1 (100%) | not published | 1 of 1 (100%) |
| `signin` | 9 of 19 (47%) | 9 of 19 (47%) | not published |
| `simpledbv2` | 0 of 4 (0%) | 0 of 2 (0%) | 0 of 2 (0%) |
| `socialmessaging` | 19 of 19 (100%) | 17 of 17 (100%) | 2 of 2 (100%) |
| `ssm-guiconnect` | 9 of 15 (60%) | 9 of 15 (60%) | not published |
| `ssm-quicksetup` | 10 of 21 (48%) | 10 of 21 (48%) | not published |
| `ssm-sap` | 20 of 21 (95%) | 20 of 21 (95%) | not published |
| `sso` | 16 of 16 (100%) | 16 of 16 (100%) | not published |
| `sso-admin` | 22 of 23 (96%) | 22 of 23 (96%) | not published |
| `sso-oidc` | 17 of 17 (100%) | 17 of 17 (100%) | not published |
| `supplychain` | 4 of 23 (17%) | 4 of 20 (20%) | 0 of 3 (0%) |
| `support-app` | 20 of 20 (100%) | 20 of 20 (100%) | not published |
| `sustainability` | 0 of 32 (0%) | not published | 0 of 32 (0%) |
| `swf` | 67 of 69 (97%) | 24 of 24 (100%) | 44 of 46 (96%) |
| `synthetics` | 15 of 24 (62%) | 15 of 20 (75%) | 0 of 4 (0%) |
| `taxsettings` | 16 of 16 (100%) | 15 of 15 (100%) | not published |
| `textract` | 16 of 24 (67%) | 10 of 10 (100%) | 6 of 14 (43%) |
| `timestream-influxdb` | 8 of 19 (42%) | 8 of 18 (44%) | not published |
| `transcribe` | 14 of 22 (64%) | 12 of 14 (86%) | 2 of 10 (20%) |
| `transcribe-streaming` | 0 of 14 (0%) | not published | 0 of 14 (0%) |
| `transfer` | 91 of 109 (83%) | 85 of 101 (84%) | 6 of 8 (75%) |
| `translate` | 15 of 20 (75%) | 9 of 10 (90%) | 6 of 10 (60%) |
| `trustedadvisor` | 20 of 20 (100%) | 20 of 20 (100%) | not published |
| `uxc` | 18 of 19 (95%) | 18 of 19 (95%) | not published |
| `verifiedpermissions` | 23 of 23 (100%) | 23 of 23 (100%) | not published |
| `vpc-lattice` | 6 of 11 (55%) | 6 of 11 (55%) | not published |
| `wafv2` | 157 of 190 (83%) | 114 of 135 (84%) | 21 of 25 (84%) |
| `wellarchitected` | 9 of 12 (75%) | 5 of 6 (83%) | 4 of 6 (67%) |
| `wickr` | 0 of 8 (0%) | 0 of 8 (0%) | not published |
| `wisdom` | 46 of 47 (98%) | 31 of 31 (100%) | 15 of 16 (94%) |
| `workspaces` | 9 of 10 (90%) | 9 of 10 (90%) | not published |
| `workspaces-instances` | 10 of 25 (40%) | 10 of 25 (40%) | not published |
| `xray` | 137 of 160 (86%) | 56 of 71 (79%) | 70 of 77 (91%) |

## Sources

- AWS Emulator v1.0.341 release: https://github.com/aws/aws-emulator/releases/tag/v1.0.341
- Per-test results published with v1.0.341: https://github.com/aws/aws-emulator/releases/download/v1.0.341/scores.json.gz
- AWS Emulator releases page: https://github.com/aws/aws-emulator/releases
- Fidelity in AWS Emulator (AWS docs): https://docs.aws.amazon.com/emulator/latest/userguide/fidelity.html
- What is AWS Emulator, including Limitations (AWS docs): https://docs.aws.amazon.com/emulator/latest/userguide/what-is-service.html
- Checking whether your project works with AWS Emulator (AWS docs): https://docs.aws.amazon.com/emulator/latest/userguide/check-project.html
- AWS Emulator Evaluation Suite: https://github.com/aws/aws-emulator-evaluation-suite
- Fidelity test manifest with plane labels: https://github.com/aws/aws-emulator-evaluation-suite/blob/main/manifest.jsonl
- Label taxonomy: https://github.com/aws/aws-emulator-evaluation-suite/blob/main/docs/TAXONOMY.md
- Runner code that groups scores by service: https://github.com/aws/aws-emulator-evaluation-suite/blob/main/src/fidelity_tests_runner/cli.py
