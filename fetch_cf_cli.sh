# Download the latest Linux 64 bit CF CLI binary from https://github.com/cloudfoundry/cli/releases
# Edit the link as newer releases are published

# Remove older references to cf_cli
./removeBlob.sh cf-linux-amd64.tgz 
wget "https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.13.0&source=github-rel" -O cf-linux-amd64.tgz
echo no | ./addBlob.sh cf-linux-amd64.tgz cf_cli
