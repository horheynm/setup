
# Google cloud

## Set up ssh to vm
OS: mac

* run `brew install --cask google-cloud-sdk`
* run `gcloud init`, then find your project in the console, select that
* run `gcloud compute config-ssh`
* run `gcloud compute instances list`, find your vm. Save your external_ip address
* ssh into your vm using the metadata from the above, make sure it works. ex. `gcloud compute ssh instance-XXXXXXXX-XXXXXX --zone=yy-yyyyyy-y`
* In your ssh-ed machine run `whoami` to get your username
* In local, make your config file in ~/.ssh 
```
Host gcp-vm
    HostName <external_ip>
    User <username>
    IdentityFile ~/.ssh/google_compute_engine

```





