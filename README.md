# HiPhase Container

A lightweight Docker container for [HiPhase](https://github.com/PacificBiosciences/HiPhase), a tool for jointly phasing small, structural, and tandem repeat variants for PacBio sequencing data.

## Version

Current version: v1.5.0

### nextflow

Based on the default, `hiphase` only flavor, there is an additional container available which includes some tools needed when running in a [Nextflow](https://www.nextflow.io/) workflow. To use it, prepend the tag with `nextflow-`, e.g., `nextflow-1.5.0`.

## Usage

```bash
docker run --rm -it ghcr.io/mhh-humangenetik/hiphase:1.5.0
```

## License

See [LICENSE](LICENSE) file for details. The license only covers this container definition and not the software contained within.