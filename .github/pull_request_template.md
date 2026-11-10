## [TICKET] Pull request title

### Description
What changes and why.

### Type
- [ ] Release (new module binary)
- [ ] Package manifest
- [ ] Documentation
- [ ] Other

### Checklist
- [ ] The Signifyd SDK (`SignifydProfilingSdk`) is not committed, attached to a release or re-hosted.
- [ ] No Signifyd token or key in the repository, `Package.swift`, package URLs or logs.
- [ ] `Package.swift` points to a published release asset and its checksum matches `swift package compute-checksum`.
- [ ] The release binary was built from `yuno-ios` with `scripts/build_framework_signifyd.sh` and passes its linkage checks.
- [ ] README updated if requirements or installation changed.

### Related tickets
