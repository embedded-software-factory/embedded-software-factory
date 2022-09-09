# Embedded Software Factory

```mermaid
graph LR
    virtual_machine --> docker
    docker --> kind
    kind --> tekton
    tekton --> pipeline
    pipeline --> target_image
    target_image --> sbom
    gpg_signature --> target_image
    gpg_signature --> sbom
```

## License

SPDX-License-Identifier: [GPL-2.0-or-later](COPYING)

## Reference

- [Supply chain Levels for Software Artifacts (SLSA)](https://slsa.dev)
- [`tekton_in_kind.sh`](https://github.com/tektoncd/plumbing/tree/main/hack#tekton_in_kindsh)
