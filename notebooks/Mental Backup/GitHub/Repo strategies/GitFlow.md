Push feature
**feature/**
- Activates CI/CD for testing only
- No deployments

**test_**
- CI/CD for test
- Deploy to DEV environment

**beta_**
- CI/CD for test
- Deploy to STG environment

**develop**
- All DEV commits get merged here first before going to staging
- Can be an optional branch

**staging**
- All STG commits get merged here first before going to production

**production**
- Prod branch with protection