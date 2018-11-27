# Package Trust

A proof-of-concept for distributed security audits of npm packages.

The setup is based on people publishing their public GPG key,
downloading an npm package from the registry, manually auditing it, and then
creating a GPG signature stating that they have audited it.

These signatures are collected and stored in a repository. One can then
later on verify that all packages that are used in a project (by parsing package-lock.json)
are properly security-audited, by people you trust.

This repository is a minimum viable product; one could imagine creating
a web application of sorts, with a database, to store the signatures and
make a more user-friendly workflow.

### How to inspect a package

1) Find out which package you want to inspect.
2) Check package metadata: `npm view left-pad` (you will get a list of versions)
3) Fetch the package: `PACKAGE="left-pad" VERSION="1.3.0" ./fetch-pkg.sh`
   The package will be downloaded and end up in the "packages" directory.
4) Do the manual inspection.
5) Create a signature

### How to sign an inspected package

1) Run the sign script: `PACKAGE="left-pad" VERSION="1.3.0" SENDER="[email]" ./sign.sh`
   ("sender" should be your e-mail address)
2) Create a pull request to this repository

### Verifying signatures for a package

1) Run the verify script: 1) Run the sign script: `PACKAGE="left-pad" VERSION="1.3.0" ./verify.sh` 

This will verify all the signatures. (Based on which GPG signatures you trust)

### Exporting a key

Export your public GPG key, put it in the "keys" folder and create a pull request.

`gpg --armor --export [email] > keys/[email].asc`

Then, create a pull request to this repository.

#### Manual inspection tips

Make sure you look at every file.
Check package.json, it should not contain anything malicious in the "scripts" section.

##### Tips for inspecting a package that contains minified files

- Try git-cloning the source code for the package.
- Do an audit of the source code.
- Run the build/minification step for the source code and generate a .tgz package.
- Verify that the checksum of your built artifact is the same as the upstream one.
