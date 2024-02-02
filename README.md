
### Az 400
### Morten la Cour
### mlc@integration-it.com




## Table of Content




### Install git

```powershell

choco install git -y

```

### Set git user info

```powershell

  git config --global user.email "xyz@gmail.com"
  git config --global user.name "John Doe"

```


### Predefined Variables

https://learn.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml


### WebApp Deploy to slot

```yaml

                    deployToSlotOrASE: true
                    slotName: preprod

```


### Tagging

```powershell
### Annotated
git tag -a v1.4 -m "my version 1.4"

### Lightweight
git tag v1.5

### Push (Tags are only local)
git push origin v1.4

### In DevOps you can ONLY do annotated

```

#### Trigger on tags

```yaml

trigger:
  tags:
    include:
    - 'v*'

```


### Artifact Feeds

Maven -> Java
npm -> node
NuGet -> C#
Python Packages (PIP) -> Python


