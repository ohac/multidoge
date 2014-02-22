### Introduction

MultiSakura is a Simplified Payment Verification (SPV) Sakuracoin desktop client.
It is ported from the MultiBit Bitcoin client. Huge thanks to the original devs for this awesome project!

MultiSakura relies on the following technologies:

* Maven as the build system, so the usual Maven processes apply. If you're not familiar
with Maven then [download it first](http://maven.apache.org) and follow their installation instructions.
* [ZXing ("Zebra Crossing")](https://code.google.com/p/zxing/) for QR codes
* [Sakuracoinj](https://github.com/ohac/sakuracoinj) for access to the Sakuracoin network
* IzPack for creating installers for Windows, Mac, Linux
* [Bitcoinj Enforcer Rules](https://github.com/gary-rowe/BitcoinjEnforcerRules) to prevent dependency chain attacks
* [XChange](https://github.com/timmolter/XChange) for access to several Bitcoin exchanges

#### A note on the Sakuracoinj dependency

MultiSakura depends on a special fork of Sakuracoinj for its Bitcoin support. This is due to legacy wallet serialization issues
and the MultiSakura team are working towards a complete integration. To build MultiSakura you will need to clone this fork from
here:
```
https://code.google.com/r/maxkeller90-dogecoinj-multibit/
```

The branch you should use for the MultiSakura develop code is: `bcj-0.10.3-mb-alice`

Once cloned, you should then install the custom Sakuracoinj library using

```
mvn clean install
```

### Branching strategy

This follows the  [master-develop](http://nvie.com/posts/a-successful-git-branching-model/) pattern.

There are 2 main branches: `master` and `develop`. The `master` branch is exclusively for releases, while the `develop`
is exclusively for release candidates. The `develop` branch always has a Maven version of `develop-SNAPSHOT`.

Every GitHub Issue gets a branch off develop. When it is complete and code reviewed it is merged into `develop`.

When sufficient Issues are merged into `develop` to justify a release, a new branch off `develop` is created with the release number (e.g. `release-1.2.3`).
The Maven `pom.xml` is updated to reflect the snapshot version (e.g. `1.2.3-SNAPSHOT`).

Once the release has been tested and is ready to go live, the final act is to update the `pom.xml` to remove the SNAPSHOT suffix and merge it into `master`.

The `master` branch is then tagged with the release number. Tags are in the format `v1.2.3` to distinguish them from branch names.

An announcement is made on the MultiSakura website to alert everyone that a new version is available.

### Maven build targets

The important targets are:

```
mvn clean package
```

which will package the MultiSakura project into `multisakura-x.y.z.jar` where `x.y.z` is the current version
number. This is suitable for local development work.

If you want to generate a complete set of multi-platform installers (Windows, Mac and Linux) you 
use the following command

```
maven clean install
```

After some processing, you will have the following artifacts in the target directory:

* an executable jar = multisakura-exe.jar
* a Mac application bundle = MultiSakura.app
* a Mac DMG file = multisakura-x.y.z.dmg
* an installer for Windows = multisakura-x.y.z-windows.exe
* an installer for Linux = multisakura-x.y.z-linux.jar

To run MultiSakura from these artifacts you can follow the instructions [provided on the main MultiSakura
website](https://multidoge.org/help.html)

### MultiSakura contains cut down JREs so is a large clone

The MultiSakura installers contain cut down JREs so the project clone is quite large.
(100 to 200 MB).

### Custom configuration

MultiSakura is quite flexible and has several features only accessible to power users through the configuration file. This
is discussed in more detail in [configuration.md](configuration.md)

### Contributing

If you want to contribute, please contact me at: [info@multidoge.org](mailto:info@multidoge.org).
