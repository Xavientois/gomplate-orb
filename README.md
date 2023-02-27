# Gomplate Orb

[![CircleCI Build Status](https://circleci.com/gh/Xavientois/gomplate-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/Xavientois/gomplate-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/xavientois/gomplate.svg)](https://circleci.com/orbs/registry/orb/xavientois/gomplate) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/Xavientois/gomplate-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

_**An orb to render Go templates in CircleCI using Gomplate**_

## Usage

In order to use this orb, just add it under the `orbs` section of your CircleCI `.circleci/config.yml`:

```yaml
orbs:
    gomplate: xaventois/gomplate@1.2.3
```

## Examples

This orb provides different components depending on your use-case.

### `render-config` job

```yaml
version: 2.1
setup: true

orbs:
    gomplate: xaventois/gomplate@1.2.3

workflows:
    use-my-orb:
        jobs:
            - gomplate/render-config:
                template-file: .circleci/continue_config.yml.tmpl
                output-file: .circleci/continue_config.yml
                pre-steps:
                    - run:
                        command: |
                            echo '{ "a": "b", list: ["x", "y", "z"] }' > values.yaml
                contexts: values.yaml
```

---

## Resources

[Documentation for this orb](https://circleci.com/orbs/registry/orb/xavientois/gomplate) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.

### How to Contribute

We welcome [issues](https://github.com/Xavientois/gomplate-orb/issues) to and [pull requests](https://github.com/Xavientois/gomplate-orb/pulls) against this repository!

### How to Publish An Update
1. Merge pull requests with desired changes to the main branch.
    - For the best experience, squash-and-merge and use [Conventional Commit Messages](https://conventionalcommits.org/).
2. Find the current version of the orb.
    - You can run `circleci orb info xavientois/gomplate | grep "Latest"` to see the current version.
3. Create a [new Release](https://github.com/Xavientois/gomplate-orb/releases/new) on GitHub.
    - Click "Choose a tag" and _create_ a new [semantically versioned](http://semver.org/) tag. (ex: v1.0.0)
      - We will have an opportunity to change this before we publish if needed after the next step.
4.  Click _"+ Auto-generate release notes"_.
    - This will create a summary of all of the merged pull requests since the previous release.
    - If you have used _[Conventional Commit Messages](https://conventionalcommits.org/)_ it will be easy to determine what types of changes were made, allowing you to ensure the correct version tag is being published.
5. Now ensure the version tag selected is semantically accurate based on the changes included.
6. Click _"Publish Release"_.
    - This will push a new tag and trigger your publishing pipeline on CircleCI.

## Licence

MIT