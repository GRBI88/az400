## Notes from course

```

Microsoft DevOps (Azure DevOps)


- DevOps
- MS DevOps
    - Code/GIT/Repos   (GitHub)
         - Branches / Strategies   Pull Requests
    - Pipelines (Automazation)
          - CI/CD   -> Azure, On-prem
          - Infrastructure as Code (IaC) -> Azure
    - Boards 
        - Project Management (10%)
    - Documentation
        - Wiki, Dashboards, Queries
    - Test Plans (End-to-end, user tests)
    - Repositories / Feed (nuget, npm, pip)
    
    - Monitoring (Azure) / Alerts

DevOps


Developers / IT Operation -> Project
PM / Stakeholders / Business


< 5    No DevOps (automization) (PS Scripts, manually)
>= 5 Devops


one man team  DevOps (auto)

Azure DevOps / MS DevOps


SaaS / PaaS 

Azure DevOps Services (SaaS) (Cloud) -> dev.azure.com (new version)
   -> Course


Azure DevOps Server (PaaS) (On-prem) -> Host IIS / SQL SERVER (CU)
    - 2019
    - 2022
    - vNext??


Entra (AAD) (Authenticated) (Who are you???) (MFA)

MS DevOps (*)    -->    Azure    O365 (Authorized)  D365

Person (on-prem) -> Azure

DevOps
  - Organizations (1-1) (Settings)  (A) (default beha..)
     - Projects (Settings) (A1)  (Name, Description, Visibility
        - Git Repos (1-M)
        - Pipelines (Multiple Pipelines)
        - Boards (PM)

    - App1 App2 App3
      App1
       Repo: App1 (default) (code + infra) (multiple pipelines)

       Repo: Code
       Repo: Infrastructure (IaC) (bicep, terraform)

     - Project (The IT department)
         

------------------------------------

GIT

De-centralized repo


GIT

          REPO (Commits)

local drive

test.txt   -> stage  -> Commit (repo)

local drive -> stage   (git add filename | .)
stage -> repo (new commit)  (git commit -m "added test.txt file"

git diff   (local/stage)
git diff --cached (stage/last commit)
git diff HEAD (local/last commit)


stage:

right now I'm good, but not "commit good"

mess up your local folder

git restore  (stage back to local)

morten



cd Morten


test.txt
Test.txt


Steps:

local folder -> git add -> stage -> git commit -> local commit 
    -> git push !! -> push the local commit into DevOps/Mothership


--------

Automization (Pipelines)


Branch

Master ----------------- -> Bran


---------------

Branch strategies

Company: on-line  (angry birds) (3-4 pushes to production) (one version)


Company: Office team (on-prem office products)
     -> release 3. year
     -> deal with multiple version

     Office 2026 (version)  -> release to test
          -> Office 2022 (in production)
              -> Bug reports (CU 2022)
          -> Office 2019 (in prod)
               -> 

-------------------

Auto (Pipelines, actions)

 New Pipeline -> save (DevOps DB) (metadata)  (repo, commits, pr, branches, version, tag)

Build/test (CI) (Pipeline)
Release/Deploy/Publish   (CD)  (azure)   (CI/CD) 

Pipeline (CI) -> All the instructions -> Save DevOps DB
Release Pipeline (CD) -> All the ins -> Save DevOps DB

----------------------------

GitHub (actions)

repo     /github-actions
              .yaml (instructions)
              .yaml

--------------------------

 repo (commit)
       .yaml (instructions)

 Create new Pipeline -> Save DevOps DB  (no instructions, thin clients 
   -> pointer to the .yaml file)

------------------------------------- 2025

CI Pipeline (build/test) -> deprecated (
   -> Only supported via. .yaml files in the repo
CD (Release pipelines) -> not off. deprecated yet.

yaml    json



name: morten la Cour

{"name" : "morten"}

## this is bla
person:
  name: morten  (at least 2 chars!!)
  address: fdfdf

{ "person" : { "name" : "morten", "address" : "fdfdfd" }}

names:
  - morten
  - john


[ "morten", "john"]


people:
  - name: "Morten"
    address: "fdsds"
  - id: 17
    name: "Morten2"
    address: "fdfdf"


[ {"name" : "Morten", "address" : "ffdfd"},{"id" : "17", "name" : "Morten2", "address" : "ffdfd"}]


stages  (build and test, release to test, wait for appr, release to prod)
   sequential
   jobs (95% need 1 job): (atomic tasks) (parallel)
      job1 -> new build server
      job2 -> new build server
     steps: (sequential)
       - script: bash/powershell
       - task: pre-installed DevOps tasks (DeployToAzureWebApps, CreateContainerImage)
       - install some sdk
       - restore
       - build
       - test
       - package the code into .zip 

Azure

Webapp

backend server   (PHP, ASPNETCore)  $$$ PaaS VM (App Service Plan)


Static (SPA, Vue, React, Angular) ($ storage) (dns)

dotnet test
    dotnet build


dotnet build
    dotnet restore



dotnet publish
   dotnet build

Stages
   Jobs  1 job = 1 fresh Build server
     Steps
       - publish the code as a zip
       - publish the code to azure



Stage build (2 hour)
    job
      steps
        - publish the code as a zip !!!!!
        - create artifact (save it to DEVOPS DB)  (bits and bytes)

Stage test
    job
       steps
         - retrieve it from artifact (load from DEVOPS DB)
         - publish the zip to azure test (!!!!)

Stage prod
    job
       steps
         - retrieve it from artifact (load from DEVOPS DB)
         - publish the zip to azure test (!!!!)


builddeploy
    build/test/publish
    -> azure


infrastructure as code (creating new sql databases, tables)
  -> azure -> deploy azure resources
      -> portal :-(
      -> azure cli / azure powershell
      -> Rest API (https://management.azure.com)
             storage account
             service bus (mq)
             log ana


  -> automatize (pipelines)
         task: AzureCLI@2
            az storage account create ..
            az servicebus namespace create ...

   1 file -> describe the whole infrastructure
               storage account
               service bus 




PUT

https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/Template

IaC

ARM Template (Manifest -> Infrastructure, Desired State -> Actual State)
JSON -> Azure knows nothing

.bicep   -> programming language / "json"  (Azure specific)  -> JSON ARM
.terraform   -> JSON ARM (language: cross-platfrom AWS...)
      resourceGroup
      storageAccount -> EUPlatform


{
   "resources" : [
	{
            "type" : "Microsoft.ServiceBus/namespaces",
            "apiVersion" : "2024-01-01",
            "name" : "fffff",
           "properties" : {
            "exteid" : "[resourceId(subit,3434,3,3,3,4,4]"
   }
         },
	{
            "type" : "Microsoft.storage/account",
            "apiVersion" : "2024-08-01",
            "name" : "gggggg",
            "properties" : {}
         }
]

}



PUT https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceBus/namespaces/{namespaceName}?api-version=2024-01-01

{
   "

}

PUT https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/res9101/providers/Microsoft.Storage/storageAccounts/sto4445?api-version=2024-01-01

{
  "sku": {
    "name": "Premium_LRS"
  },
  "kind": "BlockBlobStorage",
  "location": "eastus",
  "properties": {
    "isHnsEnabled": true,
    "isNfsV3Enabled": true,
    "enableExtendedGroups": true,
    "supportsHttpsTrafficOnly": false,
    "networkAcls": {
      "bypass": "AzureServices",
      "defaultAction": "Allow",
      "ipRules": [],
      "virtualNetworkRules": [
        {
          "id": "/subscriptions/{subscription-id}/resourceGroups/res9101/providers/Microsoft.Network/virtualNetworks/net123/subnets/subnet12"
        }
      ]
    }
  }
}



Storage Account
  Containers/Blob (Http protocol File System)
  Queue (mq) (light mq)
  Files
  Tables (light documentdb)


Service Bus Namespace (MQ tech) (premium)
   Queue (MQ)
   Topics (MQ)

CosmosDB (Premium documentdb)


Entra    -> Azure Management Layer (switch no-internet/access)

All communication between azures resources must be done via. MS network (VNET)

Managed Identity / Role Assignments


- Private Endpoints 


Virtual Network   (Resource same region AND same subscription)
  On-prem (VPN)


Resource Group 1
   R1
   R2
Resource Group 2
   R3
   R4

--------------------------------------------------------

Resource Group (region/location) (SW)
   Resource1 (region/location) (SW)
   Resource2 (region/location) (SW)

Resource Group


-----------------------------------

IaC

Template -> Repo    (2017) :-)

2025


ARM TEMPLATE   (repo)

   2017   -> Create Storage Account (Api-version 2017)
                Use Anomoy access to containers


   2025 -> 

                        



```


### Day 3

```

"code" -> Source Code only   (source controls)   -> diff
-> commit 


Author: chapters (text)

.cs
.cs
.csproj  (reference)

c#

mac
Linux
win

dotnet build -> different dll's

.dll (bin)/obj
.exe (bin)

dotnet restore


.gitignore


Service Connection  -> ARM (Azure Management Plane) (Public Cloud)






CRUD  -> Azure Resources (VM, VNET, WebApp, Resource Group, ACR....)

-> Build container  -> Azure Container Reg (Data plane)

-> Web App code!!! ->  DATA PLANE





DEVOPS -> (internet) AZURE 

Containers:

- "Mini VM"



App 

RunTimes/Prereq.

-------------------------
Containers = Linux





Server (VM), Server2


RunTimes in Containers

App1  App2
JR17  JRE18


-------------------
Elastic Search
JRE
...
-------------------
(OS)/Kernel


Containers (HDD), Containers (HDD)
----------------------------------
HDD
Linux

---------------------------------------
Container:

Kubernetes (AKS)
Container Apps
Container Instances

Azure Container Registry (DockerHub) (nuget, npm)
----------------------------------------------------
Azure WebApp (Code, Container)

Bring your own code
Bring your own container

-----------------------------------------------------

Bring my own code:
   -> MS supports the Runtimes  (.NET 8 -> 8.0.1)
$$$

Bring my own container:
   -> Self responsible for the runtime
       -> Keep your versions as long you want!!! 
$$$

--------------------------------------------------

Container strategy

Azure Web App -> AWS -> Kubernetes -> on-prem 

 - MS Creates a 3 month secret THAT CANNOT BE CHANGED IN DEVOPS!!!!
 - MS auto gives the contributor role!!!! CANNOT CREATE ROLE ASSIGNMENT!!
       - More and more devops stuff requires IaC (biceps)
       - More and more Azure should be done using Managed Identy (AND ROLE ASSIGN)
       - Owner!!! (2-3 identities being owner on each sub)

Manual
   - Create the App reg in entra
   - Create the secret
   - Azure: Give Role Assignment (owner) to the app reg
   - Create a Manual/Secret Servic Connection in DEVOPS
     - The secret can be changed in DEVOPS when always expires!!!


Federation   (NO SECRETS NEEDED)

Microsoft Devops (Own Identity Provider)


Sub1
ENTRA
VNET!!


Resource Group 1

 R1
 R2  Key/Password  (MI/Role Assignment)


RG 2

  R3
  R4


Sub2

RG


Role Assignment
   - Who (Entra ID, user, group, MI, ....)
   - What (Owner, Contributor, AcrPull) (Secret reader)
   - Where (Scope) -> Sub, RG, Resource

Management Groups
    Subscriptions
       Resource Groups
          Resources
             Sub-Resources



Cont + OWner  

   Resource Group (MortensPlayground)

Key Vault (Resource)





```