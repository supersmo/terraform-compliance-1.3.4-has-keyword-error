Commands and noutput

```
PS C:\ws\github.com\terraform-compliance-1.3.4-has-keyword-error> sc env:TF_VAR_project_id -Value "***value_here***"
PS C:\ws\github.com\terraform-compliance-1.3.4-has-keyword-error> terraform plan -out "planfile"

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_storage_bucket.example-bucket will be created
  + resource "google_storage_bucket" "example-bucket" {
      + bucket_policy_only          = (known after apply)
      + force_destroy               = false
      + id                          = (known after apply)
      + location                    = "EUR4"
      + name                        = (known after apply)
      + project                     = "xxx"
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + uniform_bucket_level_access = (known after apply)
      + url                         = (known after apply)
    }

  # random_id.random will be created
  + resource "random_id" "random" {
      + b64         = (known after apply)
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 4
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: planfile

To perform exactly these actions, run the following command to apply:
    terraform apply "planfile"


PS C:\ws\github.com\terraform-compliance-1.3.4-has-keyword-error> terraform-compliance -f ./terraform-compliance-rules -p planfile
  terraform-compliance v1.3.4 initiated
  
  . Converting terraform plan file.
  🚩 Features     : C:\ws\github.com\terraform-compliance-1.3.4-has-keyword-error\terraform-compliance-rules/
  🚩 Plan File    : C:\ws\github.com\terraform-compliance-1.3.4-has-keyword-error\planfile.json
  
  🚩 Running tests. 🎉
  
  Feature: Location restriction  # C:\ws\github.com\terraform-compliance-1.3.4-has-keyword-error\terraform-compliance-rules/locationcheck.feature
  
      Scenario: Location control on all resources that have location defined
          Given I have a resource defined that supports location
          When it has location
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to None.
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to False.
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to None.
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to *****.
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to None.
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to STANDARD.
                  Failure: location property in google_storage_bucket.example-bucket resource does not match with ^eur(4|3)$|^europe-(north1|west(1|3|4))$ case insensitive regex. It is set to True.
          Then its value must match the "^eur(4|3)$|^europe-(north1|west(1|3|4))$" regex
            Failure:
  
  1 features (0 passed, 1 failed)
  1 scenarios (0 passed, 1 failed)
  3 steps (2 passed, 1 failed)
  Run 1601280809 finished within a moment
```