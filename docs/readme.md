# Execution notes

## Summary
<!-- TOC -->

- [Execution notes](#execution-notes)
    - [Summary](#summary)
    - [Project Overview](#project-overview)
    - [Expected outcomes](#expected-outcomes)
    - [Execution plan](#execution-plan)
    - [Technical details](#technical-details)
    - [Challenges](#challenges)
    - [Security](#security)

<!-- /TOC -->

## Project Overview
The goal of this project is to evaluate my solution building skills while having fun at it.
Displaying thoroughness and innovation as well as cost and security impacts is also one of the key deliverables.

We'll use [Terraform](https://www.terraform.io/) to automate the deployment of the following resources in [Azure](https://portal.azure.com/#home):
- [ ] VNET (incl. Network Security Group)
- [ ] VM within that VNET
- [ ] Azure Blob Storage (ABS)
- [ ] Azure key vault (AKV)
- [ ] Azure function (AF)

VM logs are to be retrieved via the created Azure function (running on the same VNET ought to do it), then the key to access Azure blob storage is to be retrieved using Azure key vault then simply send these logs (WARNING and ERROR only) to Azure Blob Storage.

## Expected outcomes
- working (cost effective) solution in Azure.
- 30 minute presentation (slide deck at [presentation](./presentation))

## Execution plan
- [x] read main `readme.md`.
- [ ] read AWS example provided by Gabriel (it may provide insights and shortcuts I haven't thought of).
- [ ] create `Terraform` script to `terraform apply/destroy` VNET (it should cost peanuts 🥜).
- [ ] deploy VM last as it is likely the most expensive resource of them all.
- [ ] see what I can get out of Azure function. I am guessing I can drag drop my way there to do fun stuff for me.
- [ ] note down challenges and solutions as I progress.
- [ ] do blob reading to local terminal.
- [ ] create slide deck.
- [ ] contact Gabriel and Hemanth for follow up call.

## Technical details
Coming soon...

## Challenges
1. How to generate `WARNING/ERROR` type logs in case everything goes smoother than usual.
1. Latency: how frequent do we trigger log retrieval? Pooling or event-based?
1. How to ensure we don't send a gargantuan amount of logs to blobs, so I don't have to sell my kidney to pay for it. 😅
1. Do we write a pipeline that does `terraform apply` upon receiving updates on this repo?

## Security
- restrict VNET access via NSG.
- setup AKV in a way that we use the secret to access it in a secure fashion. I remember something like being able to have Azure recognize an app instead of using the likes of a private key or secret-based authentication.