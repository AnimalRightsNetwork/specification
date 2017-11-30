# Specifications for the Animal Rights Network
## Helpers
The 'helpers' directory contains scripts, that aid the specification process.

## Versions
The version folders ('v<MAJOR>.<MINOR>') contain the specification files for a specific version. Ideally they should be created before the implementation and stay untouched. In reality they may be altered heavily during the implementation phase.

### ER Diagrams
The ER diagrams are created using [draw.io](https://iwww.draw.io/). The 'erd.png' files contain the graphic representation and the xml code and can therefore be loaded back into draw.io.

### Constraints
The constraints describe the details of the models and database tables. They use the [modelspec helper](https://github.com/AnimalRightsNetwork/specification/blob/master/helpers/modelspec.rb) to generate html code, which can be pasted into GitHub issues.
