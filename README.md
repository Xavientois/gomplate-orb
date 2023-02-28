# Gomplate Orb

[![CircleCI Build Status](https://circleci.com/gh/Xavientois/gomplate-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/Xavientois/gomplate-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/xavientois/gomplate.svg)](https://circleci.com/orbs/registry/orb/xavientois/gomplate) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/Xavientois/gomplate-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

_**An orb to render Go templates in CircleCI using [Gomplate](https://docs.gomplate.ca/)**_

## Usage

In order to use this orb, just add it under the `orbs` section of your CircleCI `.circleci/config.yml`:

```yaml
orbs:
    gomplate: xaventois/gomplate@1.2.3
```

## Examples

### `render-template` command

This command takes a template file and the input contexts/datasources and renders the template.

```yaml
version: 2.1

orbs:
    gomplate: xaventois/gomplate@0.1.0

jobs:
    render-greeting:
        executor: gomplate/gomplate
        steps:
            - run:
                name: "Generate greeting template and input values"
                command: |
                    echo "Hello, {{ .values.name }}!" > greet.txt.tmpl
                    echo "name: CircleCI" > values.yaml
            - gomplate/render-template:
                template-file: greet.txt.tmpl
                output-file: greet.txt
                contexts: values.yaml
            - run:
                name: "Output greeting"
                command: |
                    cat test.txt

workflows:
    greeting:
        jobs:
            - render-greeting
```

### `render-config` job

This job is designed to be used as part of a Dynamic Config setup workflow. It automatically calls the `continuation/continue` job upon rendering the template.

```yaml
version: 2.1
setup: true

orbs:
    gomplate: xaventois/gomplate@0.1.0

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

## Licence

MIT
